class LikesController < ApplicationController
  before_action :authenticate_user!

  expose(:article)

  def create
    current_user.like(article)
    redirect_back(fallback_location: article)
  end

  def destroy
    current_user.unlike(article)
    redirect_back(fallback_location: article)
  end
end
