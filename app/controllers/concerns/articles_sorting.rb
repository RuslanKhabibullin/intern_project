module ArticlesSorting
  extend ActiveSupport::Concern

  included do
    SORTING_TYPES = %w(Newest Popularity).freeze
  end

  private

  def sorted_articles
    sort_type = params[:sort_type]
    if SORTING_TYPES.include?(sort_type)
      attribute_name = attribute_by_type(sort_type)
      articles_by_params.order(attribute_name => :desc)
    else
      articles_by_params.order(created_at: :desc)
    end
  end

  def attribute_by_type(type)
    type.eql?('Newest') ? :created_at : :likes_count
  end

  def articles_by_params
    if params[:user_id].nil?
      Article.all
    else
      user = User.find_by(id: params[:user_id])
      user.articles
    end
  end

end
