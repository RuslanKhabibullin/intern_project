FactoryGirl.define do
  factory :article do
    title { generate(:article_title) }
    content { generate(:article_content) }
    author
  end
end
