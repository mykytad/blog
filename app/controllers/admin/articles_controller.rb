class Admin::ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user

  def index
    status = params[:status]
    if status.nil?
      status = "public"
    end

    @articles = Article.order(:name)
    @articles = @articles.where(status: status)

    if !params[:search].nil? && params[:search] != ""
      @articles = @articles.where("lower(title) like ?", "%#{params[:search].downcase}%")
    end

    if params[:sort] == "created_at_asc"
      @articles = @articles.order("created_at ASC")
    end

    if params[:sort] == "created_at_desc"
      @articles = @articles.order("created_at DESC")
    end

    if params[:sort] == "updated_at_asc"
      @articles = @articles.order("updated_at ASC")
    end

    if params[:sort] == "updated_at_desc"
      @articles = @articles.order("updated_at DESC")
    end

    if params[:sort] == "id_desc"
      @articles = @articles.order("id DESC")
    end

    if params[:sort] == "id_asc"
      @articles = @articles.order("id ASC")
    end

    author_id = params[:author]

    if author_id
      @articles = @articles.where(user_id: author_id)
    end

    @articles = @articles.page(params[:page])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to admin_articles_path
  end
end
