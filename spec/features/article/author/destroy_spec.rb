require 'rails_helper'

feature 'Destroy Article' do
  include_context 'current user signed in'

  let(:article) { create(:article, author: current_user) }

  background { visit edit_article_path(article) }

  scenario 'Author article destroy' do
    click_link('delete', href: article_path(article))

    expect(page).not_to have_content(article.title)
    expect(page).to have_content('Successfully deleted')
  end

end