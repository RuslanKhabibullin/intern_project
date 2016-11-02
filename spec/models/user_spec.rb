require 'rails_helper'

describe User, type: :model do
  subject(:user) { described_class.new(attributes_for(:user)) }

  it { is_expected.to respond_to(:username) }
  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:password) }
  it { is_expected.to respond_to(:password_confirmation) }
  it { is_expected.to respond_to(:articles) }

  it { is_expected.to be_valid }

  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to validate_length_of(:username).is_at_least(2).is_at_most(90) }
  it { is_expected.to validate_length_of(:password).is_at_least(6).is_at_most(128) }

  describe 'password' do
    context 'when confirmation mismatch' do
      before { user.password_confirmation = 'mismatch' }

      it { is_expected.not_to be_valid }
    end
  end

  describe 'email' do
    context 'when format is invalid' do
      let(:addresses) { %w(user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com) }

      specify do
        addresses.each do |invalid_address|
          user.email = invalid_address
          expect(user).not_to be_valid
        end
      end
    end

    context 'when format is valid' do
      let(:addresses) { %w(user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn) }

      specify do
        addresses.each do |valid_address|
          user.email = valid_address
          expect(user).to be_valid
        end
      end
    end
  end
end
