class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :article_liked?, only: %i(destroy)

  expose(:article)
  expose(:like) { article.likes.find_by(user: current_user) }

  def create
    Likes::CreateLike.call(current_user: current_user, article: article)
    redirect_back(fallback_location: article)
  end

  def destroy
    like.destroy
    redirect_back(fallback_location: article)
  end

  private

  def article_liked?
    redirect_back(fallback_location: article) unless like
  end
end
