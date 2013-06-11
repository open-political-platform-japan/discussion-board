# coding: utf-8

class UsersController < ApplicationController
  respond_to :html
  permits :nickname
  load_and_authorize_resource

  # GET /users/1
  def show(id)

  end

  def new
    @user.nickname = "匿名"
  end

  # GET /users/1/edit
  def edit(id)
  end

  def create(user)
    @user.password = 'abcdefghjkmnpqrtuvwxyzABCDEFGHJKLMNPQRTUVWXY346789+-=!#$%&'.chars.sample(6).join
    @user.role = :attendee
    if @user.save
      @user.update_column(:username, @user.id)
      flash.notice = "アカウントを作成しました。他の端末で同じアカウントでログインしたい方は、<a href='#{user_path(@user)}'>マイページ</a>からパスワードを設定してください。"
      auto_login(@user)
    end
    respond_with @user, location: speaks_url
  end

  # PUT /users/1
  def update(id, user)
    if @user.update_attributes(user)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /users/1
  def destroy(id)
    @user.destroy

    redirect_to users_url
  end
end
