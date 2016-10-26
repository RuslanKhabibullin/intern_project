require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    params = { username: 'testUser', email: 'testEmail@email.com', password: 'passworD1',
               password_confirmation: 'passworD1' }

    @user = User.new(params)
  end

  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }

  describe 'username' do
    context 'when is not present' do
      before { @user.username = '' }

      it { should_not be_valid }

    end

    context 'when is too short' do
      before { @user.username = 'a' }

      it { should_not be_valid }

    end

    context 'when is too long' do
      before { @user.username = 'a' * 150 }

      it { should_not be_valid }

    end

  end

  describe 'password' do
    context 'when is not present' do
      before { @user.password = @user.password_confirmation = '' }

      it { should_not be_valid }

    end

    context 'when confirmation mismatch' do
      before { @user.password_confirmation = 'mismatch' }

      it { should_not be_valid }

    end

    context 'when is too short' do
      before { @user.password = @user.password_confirmation = 'Dd1' }

      it { should_not be_valid }

    end
  end

  describe 'email' do
    context 'when is not present' do
      before { @user.email = '' }

      it { should_not be_valid }

    end

    context 'when format is invalid' do
      it 'should be invalid' do
        addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]

        addresses.each do |invalid_address|
          @user.email = invalid_address
          expect(@user).not_to be_valid
        end
      end
    end

    context 'when format is valid' do
      it 'should be valid' do
        addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]

        addresses.each do |valid_address|
          @user.email = valid_address
          expect(@user).to be_valid
        end
      end
    end

    context 'when email already exist' do
      before do
        user_dup = @user.dup
        user_dup.save!
      end

      it { should_not be_valid }
    end
  end
end
