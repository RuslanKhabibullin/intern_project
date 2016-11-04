class BaseDecorator < Draper::Decorator
  def formatted_creation_date
    object.created_at.strftime('%d-%m-%Y')
  end
end
