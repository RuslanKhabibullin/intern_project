require 'rails_helper'

feature 'Show account profile' do
  include_context 'current user signed in'

  background do
    create(:article, author: current_user)
    create(:comment, user: current_user)
    visit user_path(current_user)
  end

  scenario 'Page contain user stats' do
    expect(page).to have_content('Articles written: 1')
    expect(page).to have_content('Comments written: 1')
  end
end
