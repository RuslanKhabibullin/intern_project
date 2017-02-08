class User < ApplicationRecord
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :validatable,
    :omniauthable,
    omniauth_providers: %i(google_oauth2)

  has_many :articles, foreign_key: "author_id", dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_articles, through: :likes, source: :article

  validates :username, presence: true, length: { minimum: 2, maximum: 90 }

  enum locale: %i(en ru)

  def self.from_omniauth(access_token)
    data = access_token.info

    where(email: data["email"]).first_or_create do |user|
      user.username = data["name"]
      user.email = data["email"]
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
