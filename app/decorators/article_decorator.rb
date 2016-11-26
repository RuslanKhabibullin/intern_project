class ArticleDecorator < ApplicationDecorator
  decorates_association :author

  delegate :title, :content, :likes_count
  delegate :username, to: :author, prefix: true

  def content_preview
    h.truncate(object.content, length: 250, separator: " ")
  end

  def liked_by?(user)
    user = user.to_model
    object.liked_by?(user)
  end

  def user_like(user)
    object.likes.find_by(user: user)
  end
end
