class AdminPagesController < ApplicationController
  before_action :admin_user

  def comments
  end

  def articles
  end

  def users
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
