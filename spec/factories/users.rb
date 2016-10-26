FactoryGirl.define do

  factory :user do
    sequence(:username) { |n| "User#{ n }" }
    sequence(:email) { |n| "userEmail#{ n }@email.com" }
    password 'passworD12'
    password_confirmation 'passworD12'
  end

end
