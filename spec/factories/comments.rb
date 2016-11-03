FactoryGirl.define do
  factory :comment do
    article
    user
    text { generate(:comment_text) }
  end
end
