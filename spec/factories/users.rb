FactoryGirl.define do
  factory :user, aliases: [:author] do
    email
    username
    password "passworD12"
    password_confirmation "passworD12"
  end
end
