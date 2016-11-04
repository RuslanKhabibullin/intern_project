class ArticleDecorator < BaseDecorator
  decorates_association :author
  delegate :id, :title, :content, :author_id
  # How to clearly use Decorated objects with forms?
  delegate :to_key, :persisted?, :errors
  delegate :username, to: :author, prefix: true

  def content_preview
    if object.content.length > 250
      "#{ object.content.first(250) }..."
    else
      object.content
    end
  end
end
