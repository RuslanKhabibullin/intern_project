class Like < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :article_id, presence: true
  validates :user_id, presence: true, uniqueness: { scope: :article_id }
end
