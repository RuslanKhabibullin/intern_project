class ArticleDecorator < ApplicationDecorator
  decorates_association :author

  delegate :title, :content, :likes_count, :liked_by?
  delegate :username, to: :author, prefix: true

  def content_preview
    h.truncate(object.content, length: 250, separator: " ")
  end

  def user_like(user)
    object.likes.find_by(user: user)
  end
end
