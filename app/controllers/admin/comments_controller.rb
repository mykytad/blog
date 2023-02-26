class Admin::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user

  def index
    @comments = Comment.all
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
