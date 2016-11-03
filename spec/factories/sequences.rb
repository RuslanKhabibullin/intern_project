FactoryGirl.define do
  sequence(:email) { Faker::Internet.email }
  sequence(:username) { Faker::Internet.user_name }
  sequence(:article_title) { Faker::Lorem.sentence }
  sequence(:article_content) { Faker::Lorem.sentence }
  sequence(:comment_text) { Faker::Lorem.sentence(6) }
end
