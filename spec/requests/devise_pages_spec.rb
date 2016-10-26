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
        fill_in 'Username', with: user_params[:username]
        fill_in 'Email', with: user_params[:email]
        fill_in 'Password', with: user_params[:password]
        fill_in 'Confirmation', with: user_params[:password_confirmation]
        click_button('SignUp')
      end

      it { should have_selector('div.alert.alert-notice') }
      it { should have_content('Success') }
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

      it { should have_selector('div.alert.alert-warning') }
      it { should have_content('Invalid') }

    end

    context 'when authorization is valid' do
      before do
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'SignIn'
      end

      it { should have_selector('div.alert.alert-notice') }
      it { should have_content('Success') }

    end
  end

  describe 'Edit page' do
  end
end