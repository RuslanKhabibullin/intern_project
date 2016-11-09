class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!, only: [:destroy]

  expose_decorated(:article)
  expose_decorated(:comments) { article.comments.order(:created_at) }
  expose(:comment)

  def create
    comment.user = current_user
    comment.article = article
    comment.save
    render 'articles/show'
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
