class UserDecorator < BaseDecorator
  delegate :id, :username, :email

  def exist?
    object.id.present?
  end
end
