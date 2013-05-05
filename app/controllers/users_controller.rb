# coding: utf-8

class UsersController < ApplicationController
  permits :nickname
  before_filter do
    @user = params[:id] ? User.find(params[:id]) : (current_user || User.new(params[:user]))
  end

  # GET /users/1
  def show(id = nil)

  end

  # GET /users/1/edit
  def edit
  end

  # PUT /users/1
  def update(user)
    if @user.update_attributes(user)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy

    redirect_to users_url
  end
end
