class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!, only: [:destroy]

  expose_decorated(:comment)

  def create
    comment.user = current_user
    if comment.save
      respond_with(comment, location: article_path(comment.article))
    else
      redirect_back(fallback_location: root_path, alert: 'Comment error')
    end
  end

  def destroy
    comment.destroy
    respond_with(comment, location: article_path(comment.article))
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :article_id)
  end

  def authorize_user!
    authorize(comment, :manage?)
  end
end
