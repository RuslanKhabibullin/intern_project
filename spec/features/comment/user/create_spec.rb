require 'rails_helper'

feature 'Comment create' do
  include_context 'current user signed in'

  let(:article) { create(:article, author: current_user) }
  let(:comment_attributes) { attributes_for(:comment) }

  background { visit article_path(article) }

  scenario 'User fill form with invalid data' do
    click_button('Create Comment')

    expect(page).to have_content('Comment error')
  end

  scenario 'User fill form with valid data' do
    fill_form(:comment, comment_attributes)
    click_button('Create Comment')

    expect(page).to have_content('successfully created')
    expect(page).to have_content(comment_attributes[:text])
  end
end
