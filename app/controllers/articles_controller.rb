class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  expose_decorated(:article)
  expose_decorated(:articles) { articles_by_params.order(created_at: :desc) }
  expose_decorated(:comments) { article.comments.order(:created_at) }

  def new
  end

  def create
    if article.save
      redirect_to article, notice: 'Successfully created'
    else
      render :new
    end
  end

  def show
    @comment = article.comments.build
  end

  def index
  end

  def edit
  end

  def update
    if article.update_attributes(article_params)
      redirect_to article, notice: 'Successfully updated'
    else
      render :edit
    end
  end

  def destroy
    article.destroy!
    redirect_to articles_path, notice: 'Successfully deleted'
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
    article_params = params.require(:article).permit(:title, :content)
    article_params.merge(author_id: current_user.id)
  end
end
