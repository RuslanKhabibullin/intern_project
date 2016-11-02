require 'rails_helper'

feature 'Create article' do
  include_context 'current user signed in'

  let(:article_attributes) { attributes_for(:article) }

  background { visit new_article_path }

  scenario 'User create article with invalid data' do
    fill_form(:article, article_attributes.except(:title))
    click_button('Create Article')

    expect(page).to have_selector('div.alert.alert-danger')
  end

  scenario 'User create article with valid data' do
    fill_form(:article, article_attributes)
    click_button('Create Article')

    expect(page).to have_content(article_attributes[:title])
    expect(page).to have_content(current_user.username)
  end
end