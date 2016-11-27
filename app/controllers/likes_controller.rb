class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user_like, only: %i(destroy)

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

  private

  def current_user_like
    redirect_back(fallback_location: article) unless like.user == current_user
  end
end
