require 'rails_helper'

feature 'Create like' do
  include_context 'current user signed in'

  let(:article) { create(:article, author: current_user) }

  before { visit article_path(article) }

  scenario 'User like article' do
    click_button 'Like'
    expect(page).to have_content('Likes: 1')
    expect(page).to have_link('Unlike', href: article_unlike_path(article))
  end
end
