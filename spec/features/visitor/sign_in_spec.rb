require "rails_helper"

feature "Sign in" do
  let(:user) { create(:user) }

  background { visit new_user_session_path }

  scenario "Visitor sign in with invalid data" do
    fill_form(:user, :edit, email: user.email, password: "mismatch")
    click_button "SignIn"

    expect(page).to have_content "Invalid"
  end

  scenario "Visitor sign in with valid data" do
    fill_form(:user, email: user.email, password: user.password)
    click_button "SignIn"

    expect(page).to have_content "Signed in"
    expect(page).to have_link "Log out", href: destroy_user_session_path
  end
end
