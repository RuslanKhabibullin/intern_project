def sign_in(user)
  visit new_user_session_path
  fill_form(:user, { email: user.email, password: user.password })
  click_button('SignIn')
end