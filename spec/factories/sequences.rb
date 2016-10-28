FactoryGirl.define do
  sequence(:email) { Faker::Internet.email }
  sequence(:username) { Faker::Internet.user_name }
end