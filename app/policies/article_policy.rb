class ArticlePolicy < ApplicationPolicy
  def manage?
    record.author == user
  end
end
