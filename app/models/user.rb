class User < ApplicationRecord

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable

  validates :username, presence: true, length: { minimum: 3, maximum: 90 }
end
