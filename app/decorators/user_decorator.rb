class UserDecorator < ApplicationDecorator
  delegate :id, :username, :email, :persisted?

  def articles_count
    object.articles.count
  end

  def comments_count
    object.comments.count
  end
end
