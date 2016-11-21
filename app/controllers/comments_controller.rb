class CommentsController < ApplicationController
  include CommentsPagination

  before_action :authenticate_user!
  before_action :authorize_user!, only: [:destroy]

  expose_decorated(:article)
  expose(:comment)

  def create
    comment.user = current_user
    comment.article = article
    if comment.save
      respond_with(comment, location: article)
    else
      render "articles/show"
    end
  end

  def destroy
    comment.destroy
    respond_with(comment, location: article)
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :article_id)
  end

  def authorize_user!
    authorize(comment, :manage?)
  end
end
