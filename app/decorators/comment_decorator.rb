class CommentDecorator < BaseDecorator
  decorates_association :user
  decorates_association :article

  delegate :text, :article_id
  delegate :username, to: :user

end
