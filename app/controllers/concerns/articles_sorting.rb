module ArticlesSorting
  extend ActiveSupport::Concern

  included do
    expose_decorated(:user)
    helper_method :article_sorting_types
  end

  private

  SORTING_TYPES = %w(newest popularity).freeze

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
    type.eql?("newest") ? :created_at : :likes_count
  end

  def articles_by_params
    user.persisted? ? user.articles : Article.all
  end

  def article_sorting_types
    SORTING_TYPES.map do |sorting_type|
      [I18n.t("views.article.sorting.types.#{sorting_type}"), sorting_type]
    end
  end
end
