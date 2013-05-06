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
  def create(user)
    if @user.save
      redirect_to admin_user_path(@user), notice: 'User was successfully created.'
    else
      render action: 'new'
    end
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

    redirect_to users_url
  end
end
