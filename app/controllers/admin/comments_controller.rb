class Admin::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user

  def index
    status = params[:status]
    if status.nil?
      status = "public"
    end

    @comments = Comment.order(:name)
    @comments = @comments.where(status: status)
    @comments = @comments.page params[:page]
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to admin_comments_path
  end
end
