class ArticleDecorator < BaseDecorator
  decorates_association :author
  delegate :id, :title, :content, :author_id
  delegate :username, to: :author, prefix: true

  def content_preview
    if object.content.length > 250
      "#{ object.content.first(250) }..."
    else
      object.content
    end
  end
end
