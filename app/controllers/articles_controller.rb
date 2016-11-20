class ArticlesController < ApplicationController
  include ArticlesSorting

  before_action :authenticate_user!
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  expose_decorated(:article)
  expose_decorated(:articles) { sorted_articles.page(params[:page]).per(2) }
  expose_decorated(:comments) { paginated_comments }
  expose(:comment) { article.comments.build }

  def new
  end

  def create
    article.author = current_user
    article.save
    respond_with(article)
  end

  def show
  end

  def index
  end

  def edit
  end

  def update
    article.update_attributes(article_params)
    respond_with(article)
  end

  def destroy
    article.destroy!
    respond_with(article, location: articles_path)
  end

  private

  def authorize_user!
    authorize(article, :manage?)
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def paginated_comments
    comments = article.comments.order(:created_at)
    comments.page(params[:page]).per(15)
  end
end
