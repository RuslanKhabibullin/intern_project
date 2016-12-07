class Article < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  validates :title, presence: true, length: { minimum: 2, maximum: 150 }, uniqueness: { case_sensitive: false }
  validates :content, presence: true
  validates :author_id, presence: true

  def liked_by?(user)
    liked_users.include? user
  end
end
