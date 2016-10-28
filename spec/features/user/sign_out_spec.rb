require 'rails_helper'

feature 'Sign out' do
  include_context 'current user signed in'

  scenario 'User success sign out' do
    visit root_path

    expect(page).to have_link('Log out', href: destroy_user_session_path)

    click_link 'Log out'

    expect(page).to have_content('Authorization')
    expect(page).to have_content('You need to sign in or sign up before continuing.')
    expect(page).to have_selector('div.alert.alert-alert')
  end
end