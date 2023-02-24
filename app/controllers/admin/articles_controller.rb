class Admin::ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user

  def index
    @articles = Article.all
  end

  def destroy
    @article = current_user.articles.find(params[:id])
    @article.destroy
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
