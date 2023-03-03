class Admin::ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user

  def index
    status = params[:status]
    if status == nil
      status = "public"      
    end
    @articles = Article.order(:name)
    @articles = @articles.where(status: status)
    if params[:search] != nil && params[:search] != ""
      @articles = @articles.where(title: params[:search])
    end
    @articles = @articles.page(params[:page])
    # Article.where("title = ?", params[:title])
    # @articles = Article.all
  end 

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to admin_articles_path
  end
end
