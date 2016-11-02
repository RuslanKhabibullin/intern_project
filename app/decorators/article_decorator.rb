class ArticleDecorator < Draper::Decorator
  delegate :title, :content, :created_at, :updated_at, :author_id
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

  def formatted_creation_date
    object.created_at.strftime('%d-%m-%Y')
  end

  private

  def author
    @author ||= object.author.decorate
  end
end
