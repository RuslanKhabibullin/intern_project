class ArticleDecorator < ApplicationDecorator
  decorates_association :author

  delegate :title, :content, :likes_count
  delegate :username, to: :author, prefix: true

  def content_preview
    h.truncate(object.content, length: 250, separator: " ")
  end

  def liked_by?(user)
    object.liked_users.include? user
  end
end
