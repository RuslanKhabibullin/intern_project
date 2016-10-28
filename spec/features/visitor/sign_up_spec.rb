require 'rails_helper'

feature 'Sign up' do
  let(:user_attributes) { FactoryGirl.attributes_for(:user) }

  background { visit new_user_registration_path }

  scenario 'Visitor sign up with invalid data' do
    fill_form(:user, user_attributes.except(:password_confirmation))
    click_button 'SignUp'

    expect(page).to have_selector('div.alert.alert-danger')
  end

  scenario 'Visitor sign up with valid data' do
    fill_form(:user, user_attributes)
    click_button 'SignUp'

    expect(page).to have_selector('div.alert.alert-notice')
    expect(page).to have_content('Articles')
  end
end
