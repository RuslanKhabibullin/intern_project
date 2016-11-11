class ArticleDecorator < BaseDecorator
  decorates_association :author

  delegate :title, :content, :likes_count
  delegate :username, to: :author, prefix: true

  def content_preview
    if object.content.length > 250
      "#{ object.content.first(250) }..."
    else
      object.content
    end
  end

  def liked_by?(user)
    user = user.to_model
    object.liked_by?(user)
  end
end
