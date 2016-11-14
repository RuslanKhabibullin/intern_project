class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 2, maximum: 150 },
            uniqueness: { case_sensitive: false }
  validates :content, presence: true
  validates :author_id, presence: true
end
