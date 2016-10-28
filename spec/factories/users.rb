FactoryGirl.define do
  factory :user do
    email
    username
    password 'passworD12'
    password_confirmation 'passworD12'
  end
end
