class CommentDecorator < BaseDecorator
  decorates_association :user
  decorates_association :article

  delegate :text
  delegate :username, to: :user

end
