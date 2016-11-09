class CommentPolicy < BasePolicy
  def initialize(user, comment)
    self.user = user
    @comment = comment
  end

  def manage?
    @comment.user == user
  end
end
