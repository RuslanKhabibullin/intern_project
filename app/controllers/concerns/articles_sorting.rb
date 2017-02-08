module ArticlesSorting
  extend ActiveSupport::Concern

  included do
    expose_decorated(:user)
    helper_method :article_sorting_types
  end

  private

  def sorted_articles
    sort_type = params[:sort_type]
    OrderArticles.new(articles_by_params, sort: sort_type).all
  end

  def articles_by_params
    user.persisted? ? user.articles : Article.all
  end

  def article_sorting_types
    @article_sorting_types ||= OrderArticles::ORDER_TYPES.map do |order_type|
      [I18n.t("views.article.sorting.types.#{order_type}"), order_type]
    end
  end
end
