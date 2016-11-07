class BaseDecorator < Draper::Decorator
  # How to clearly use Decorated objects with forms?
  delegate :to_key, :persisted?, :errors

  def formatted_creation_date
    object.created_at.strftime('%d-%m-%Y')
  end
end
