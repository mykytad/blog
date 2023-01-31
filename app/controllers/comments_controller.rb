class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    @comment.user_id = current_user.id
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = current_user.article.find(params[:article_id])
    @comment = @article.current_user.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end