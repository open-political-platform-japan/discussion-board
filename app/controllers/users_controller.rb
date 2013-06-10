# coding: utf-8

class UsersController < ApplicationController
  respond_to :html
  permits :nickname
  load_and_authorize_resource

  # GET /users/1
  def show(id)

  end

  # GET /users/1/edit
  def edit(id)
  end

  def create(user)
    if @user.save
      flash.notice = I18n.t("helpers.notices.created", model: User.model_name.human)
      auto_login(@user)
    end
    respond_with @user, location: root_url
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
