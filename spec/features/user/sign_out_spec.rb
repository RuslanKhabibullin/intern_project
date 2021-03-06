require "rails_helper"

feature "Sign out" do
  include_context "current user signed in"

  scenario "User success sign out" do
    visit root_path
    click_link "Log out"

    expect(page).to have_content "Authorization"
  end
end
