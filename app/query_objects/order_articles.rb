class OrderArticles
  ORDER_TYPES = %w(newest popularity).freeze

  def initialize(relation, sort_params = {})
    @relation = relation
    @sort_params = sort_params
  end

  def all
    sort_type = @sort_params[:sort].presence_in(ORDER_TYPES) || :newest
    send("by_#{sort_type}")
  end

  private

  def by_newest
    @relation.order(created_at: :desc)
  end

  def by_popularity
    @relation.order(likes_count: :desc)
  end
end
