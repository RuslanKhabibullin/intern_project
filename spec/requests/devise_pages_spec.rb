require 'rails_helper'

describe 'Devise pages' do

  subject { page }
  let(:user) { FactoryGirl.create(:user) }

  def update_user
    fill_in 'New password', with: '123456G'
    fill_in 'Confirm your new password', with: '123456G'
    click_button 'Change my password'
  end

  describe 'SignUp page' do
    before { visit new_user_registration_path }

    it { should have_field('Username') }
    it { should have_field('Email') }
    it { should have_field('Password') }
    it { should have_field('Password confirmation') }
    it { should have_button('SignUp') }

    context 'when registration is invalid' do
      before { click_button('SignUp') }

      it { should have_content('problems') }
    end

    context 'when registration is success' do
      before do
        user_params = FactoryGirl.attributes_for(:user)
        fill_form(:user, user_params)
        click_button('SignUp')
      end

      it { should have_selector('div.alert.alert-notice') }
      it { should have_content('Welcome') }
      it { should have_content('Articles') }

    end
  end

  describe 'SignIn page' do
    before { visit new_user_session_path }

    it { should have_field('Email') }
    it { should have_field('Password') }
    it { should have_button('SignIn') }

    context 'when authorization is invalid' do
      before { click_button 'SignIn' }

      it { should have_selector('div.alert.alert-alert') }
      it { should have_content('Invalid') }

    end

    context 'when authorization is valid' do
      before do
        fill_form(:user, { email: user.email, password: user.password })
        click_button 'SignIn'
      end

      it { should have_selector('div.alert.alert-notice') }
      it { should have_content('Signed in') }
      it { should have_link('Log out', href: destroy_user_session_path ) }

    end
  end

  describe 'Log out' do
    before do
      sign_in(user)
      click_link('Log out', href: destroy_user_session_path)
    end

    it { should have_content('Authorization') }
    it { should have_content('You need to sign in or sign up before continuing.') }
    it { should have_selector('div.alert.alert-alert') }
  end

  describe 'Edit page' do
    before do
      sign_in(user)
      visit edit_user_registration_path
    end

    it { should have_content('Edit User') }
    it { should have_field('Email') }
    it { should have_field('Password') }

    context 'when invalid data' do
      before { click_button 'Update' }

      it { should have_content('problems') }
    end

    context 'when valid data' do
      let(:new_username) { 'newUsername' }

      before do
        user_params = { username: new_username, current_password: user.password }
        fill_form(:user, :edit, user_params)
        click_button 'Update'
      end

      specify { expect { current_user.reload.username }.eql? new_username }
      it { should have_content('updated') }
      it { should have_selector('div.alert.alert-notice') }

    end
  end

  describe 'Forgot password page' do

    let(:send_button) { 'Send instructions' }

    before { visit new_user_password_path }

    context 'when form invalid' do
      before { click_button send_button }

      it { should have_content('problems') }
      it { should have_selector('div.alert.alert-danger') }

    end

    context 'when form is valid' do
      before do
        fill_in 'Email', with: user.email
        click_button send_button
      end

      it { should have_selector('div.alert.alert-notice') }
      it { should have_content('You will receive an email') }

      specify 'user reset his password' do
        open_email(user.email)
        expect(current_email).to have_subject('Reset password instructions')
        visit_in_email('Change my password')
        update_user
        expect(page).to have_content('Your password has been changed successfully')
      end
    end
  end
end