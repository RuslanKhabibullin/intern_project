require "rails_helper"

feature "Cancel account" do
  include_context "current user signed in"

  background { visit edit_user_registration_path }

  scenario "User cancel own account" do
    click_link "Cancel my account"

    expect(page).to have_content "Authorization"

    fill_form(:user, email: current_user.email, password: current_user.password)
    click_button "SignIn"

    expect(page).to have_content "Invalid"
  end
end
