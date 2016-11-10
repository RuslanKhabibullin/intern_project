class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable

  has_many :articles, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_articles, through: :likes, source: :article

  validates :username, presence: true, length: { minimum: 2, maximum: 90 }

  def like_toggle(article)
    liked_article?(article) ? unlike(article) : like(article)
  end

  def like(article)
    like = likes.build(article: article)
    likes << like
  end

  def unlike(article)
    likes.find_by(article: article).try(:destroy)
  end

  def liked_article?(article)
    liked_articles.include?(article)
  end
end
