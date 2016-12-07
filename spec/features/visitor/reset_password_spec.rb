require "rails_helper"

feature "Reset password" do
  let(:user) { create(:user) }
  let(:new_password) { "newHardPassword2" }

  def update_user
    fill_in "New password", with: new_password
    fill_in "Confirm your new password", with: new_password
    click_button "Change my password"
  end

  def fill_and_submit_reset_form(email)
    fill_in "Email", with: email
    click_button "Send instructions"
  end

  background { visit new_user_password_path }

  scenario "Visitor fill reset form with invalid email" do
    fill_and_submit_reset_form("wrongEmail@email.com")

    expect(page).to have_content "problems"
  end

  scenario "Visitor resets his password" do
    fill_and_submit_reset_form(user.email)

    open_email user.email

    visit_in_email("Change my password")
    update_user

    expect(page).to have_content "Your password has been changed successfully"
  end
end
