class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable

  has_many :articles, foreign_key: 'author_id'

  validates :username, presence: true, length: { minimum: 2, maximum: 90 }
end
