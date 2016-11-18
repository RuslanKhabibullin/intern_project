class LikesController < ApplicationController
  before_action :authenticate_user!

  expose(:article)
  expose(:like)

  def create
    Likes::CreateLike.call(current_user: current_user, article: article)
    redirect_back(fallback_location: article)
  end

  def destroy
    like.destroy!
    redirect_back(fallback_location: article)
  end
end
