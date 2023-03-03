class Admin::ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user

  def index
    status = params[:status]
    @articles = Article.order(:name).where(status: status).page(params[:page])
    # Article.where("title = ?", params[:title])
    # @articles = Article.all
  end 

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to admin_articles_path
  end
end
