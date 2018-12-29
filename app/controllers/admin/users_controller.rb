# frozen_string_literal: true

class Admin::UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to admin_users_path, notice: t('.notice')
    else
      render :new
    end
  end

  def update
    if @user.update user_params
      redirect_to admin_users_path, notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path, notice: t('.notice')
    else
      redirect_to admin_users_path, alert: t('.alert')
    end
  end

  protected

  def set_user
    @user = User.find params[:id]
  end

  def user_params
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    params.require(:user).permit :email, :name, :avatar, :description, :password, :password_confirmation
  end
end
