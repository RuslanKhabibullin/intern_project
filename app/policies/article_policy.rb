class ArticlePolicy
  def initialize(user, article)
    @user = user
    @article = article
  end

  def manage?
    @article.author_id == @user.id
  end
end