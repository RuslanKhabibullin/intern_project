FactoryGirl.define do
  sequence(:email) { Faker::Internet.email }
  sequence(:username) { Faker::Internet.user_name }
  sequence(:article_title) { Faker::Lorem.word }
  sequence(:article_content) { Faker::Lorem.sentence }
end
