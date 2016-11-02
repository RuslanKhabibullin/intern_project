class UserDecorator < Draper::Decorator
  delegate :id, :username, :email
end
