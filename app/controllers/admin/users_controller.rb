# coding: utf-8

class Admin::UsersController < ApplicationController
  permits :spam
  load_and_authorize_resource

  # GET /users
  def index
  end

  # GET /users/1
  def show(id)
  end

  # GET /users/new
  def new
  end

  # GET /users/1/edit
  def edit(id)
  end

  # POST /users
  def create
    users = params[:users]
    count = 0
    users.split(/\n/).each do |line|
      username, password = line.split(/,/)
      User.create!(username: username, nickname: "匿名_#{username}", password: password.chomp, role: :attendee)
      count += 1
    end
    redirect_to admin_users_path, notice: "#{count} users were successfully created."
  end

  # PUT /users/1
  def update(id, user)
    if @user.update_attributes(user)
      redirect_to admin_user_path(@user), notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /users/1
  def destroy(id)
    @user.destroy

    redirect_to admin_users_url
  end
end
