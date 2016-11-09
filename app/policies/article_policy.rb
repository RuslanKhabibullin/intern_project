class ArticlePolicy < BasePolicy
  def initialize(user, article)
    self.user = user
    @article = article
  end

  def manage?
    @article.author == user
  end
end
