require 'rails_helper'

feature 'Comments pagination' do
  include_context 'current user signed in'

  let(:article) { create(:article, author: current_user) }

  it_behaves_like 'a paginated resource' do
    let(:resource_creation) { 15.times { create(:comment, article: article) }}
    let(:path) { article_path(article) }
  end
end
