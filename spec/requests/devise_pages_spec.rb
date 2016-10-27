require 'rails_helper'

describe 'Devise pages' do

  subject { page }
  let(:user) { FactoryGirl.create(:user) }

  describe 'SignUp page' do
    before { visit new_user_registration_path }

    it { should have_field('Username') }
    it { should have_field('Email') }
    it { should have_field('Password') }
    it { should have_field('Confirmation') }
    it { should have_button('SignUp') }

    context 'when registration is invalid' do
      before { click_button('SignUp') }

      it { should have_content('problems') }
    end

    context 'when registration is success' do
      before do
        user_params = FactoryGirl.attributes_for(:user)

        # Refactor needed(Formulaic throws errors)!

        fill_in 'Username', with: user_params[:username]
        fill_in 'Email', with: user_params[:email]
        fill_in 'Password', with: user_params[:password]
        fill_in 'Confirmation', with: user_params[:password_confirmation]
        click_button('SignUp')
      end

      it { should have_selector('div.alert.alert-notice') }
      it { should have_content('Welcome') }
      it { should have_content('Articles') }

    end
  end

  describe 'SignIn page' do
    before { visit new_user_session_path }

    # Remove to shared_example. But how to name? it_behaves_like 'signup_page_fields' ?

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
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'SignIn'
      end

      it { should have_selector('div.alert.alert-notice') }
      it { should have_content('Signed in') }

    end
  end

  describe 'Edit page' do
    before do
      sign_in user
      visit edit_user_registration_path
    end

    it { should have_content('Edit User') }
    it { should have_field('Email') }
    it { should have_field('Password') }

    context 'when invalid editing' do
      before { click_button 'Update' }

      it { should have_content('problems') }
    end

    context 'when valid editing' do
      let(:new_username) { 'newUsername' }

      before do
        fill_in 'Email', with: user.email
        fill_in 'Username', with: new_username
        fill_in 'Current password', with: user.password
        click_button 'Update'
      end

      specify { expect { user.reload.username }.eql? new_username }
      it { should have_content('updated') }
      it { should have_selector('div.alert.alert-notice') }

    end
  end

  describe 'Forgot password page' do

    # Need to finish

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
        @email = ActionMailer::Base.deliveries.last
      end

      it { should have_selector('div.alert.alert-notice') }
      it { should have_content('You will receive an email') }

    end
  end

end