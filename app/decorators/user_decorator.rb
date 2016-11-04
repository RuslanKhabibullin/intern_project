class UserDecorator < BaseDecorator
  delegate :id, :username, :email
end
