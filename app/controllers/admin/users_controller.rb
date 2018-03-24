class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update, :destroy]

  def index
    @users = User.where.not id: current_admin_user.id
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
      # devise auto redirect_to show user page -> not use show user page anymore
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path, notice: 'Xóa tài khoản thành công'
    else
      redirect_to admin_users_path, alert: 'Xóa tài khoản thất bại'
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
