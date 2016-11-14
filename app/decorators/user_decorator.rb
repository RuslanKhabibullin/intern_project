class UserDecorator < BaseDecorator
  delegate :id, :username, :email

  def exist?
    object.id.present?
  end

  def articles_length
    object.articles.length
  end

  def comments_length
    object.comments.length
  end
end
