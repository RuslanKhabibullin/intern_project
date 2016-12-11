shared_context "current user signed in" do
  let(:current_user) { create(:user) }

  background do
    visit new_user_session_path
    fill_in "Email", with: current_user.email
    fill_in "Password", with: current_user.password
    click_button "Authorization"
  end
end
