class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user

  def index
    @users = User.all
  end

  def destroy
    User.find(params[:id]).destroy
    @user.destroy
    flash[:success] = "User deleted"

    redirect_to admin_users_path
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
