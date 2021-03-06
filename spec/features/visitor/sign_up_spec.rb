require "rails_helper"

feature "Sign up" do
  let(:user_attributes) { attributes_for(:user) }

  background { visit new_user_registration_path }

  scenario "Visitor sign up with invalid data" do
    fill_form(:user, user_attributes.except(:password_confirmation))
    click_button "Registration"

    expect(page).to have_content "problems"
  end

  scenario "Visitor sign up with valid data" do
    fill_form(:user, user_attributes)
    click_button "Registration"

    expect(page).to have_link("Log out", href: destroy_user_session_path)
  end
end
