class LikesController < ApplicationController
  before_action :authenticate_user!

  expose(:article)

  def create
    current_user.like(article)
    redirect_to(article)
  end

  def destroy
    current_user.unlike(article)
    redirect_to(article)
  end
end
