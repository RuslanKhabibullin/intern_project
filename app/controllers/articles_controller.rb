class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  expose_decorated(:article)
  expose_decorated(:articles) { articles_by_params.order(created_at: :desc) }
  expose_decorated(:comments) { article.comments.order(:created_at) }
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

  def articles_by_params
    if params[:user_id].nil?
      Article.all
    else
      user = User.find_by(id: params[:user_id])
      user.articles
    end
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
