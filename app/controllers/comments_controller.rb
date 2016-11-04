class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!, only: [:destroy]

  expose_decorated(:comment)

  def create
    if comment.save
      redirect_to article_path(comment.article), notice: 'Comment created'
    else
      redirect_to article_path(comment.article)
    end
  end

  def destroy
    comment.destroy!
    redirect_to article_path(comment.article), notice: 'Comment deleted'
  end

  private

  def comment_params
    comment_params = params.require(:comment).permit(:text, :article_id)
    comment_params.merge(user_id: current_user.id)
  end

  def authorize_user!
    authorize(comment, :manage?)
  end
end
