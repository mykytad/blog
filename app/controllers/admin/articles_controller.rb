class Admin::ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user

  def index
    @articles = Article.all
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to admin_articles_path
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
