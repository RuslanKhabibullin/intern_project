class LikesController < ApplicationController
  before_action :authenticate_user!

  expose(:article)

  def create
    Likes::CreateLike.call(current_user: current_user, article: article)
    redirect_back(fallback_location: article)
  end

  def destroy
    if like = article.likes.find_by(user: current_user)
      like.destroy
    end
    redirect_back(fallback_location: article)
  end
end
