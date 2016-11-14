class BaseDecorator < Draper::Decorator
  delegate :to_model

  def formatted_creation_date
    object.created_at.strftime('%d-%m-%Y')
  end
end
