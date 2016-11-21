module CommentsPagination
  extend ActiveSupport::Concern

  included do
    expose_decorated(:comments) { paginated_comments }
  end

  private

  def paginated_comments
    comments = article.comments.order(:created_at)
    comments.page(params[:page]).per(10)
  end

end
