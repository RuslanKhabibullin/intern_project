author = FactoryGirl.create(:user)
(1..9).each { FactoryGirl.create(:user) }
(1..5).each { FactoryGirl.create(:article, author: author) }

User.first(4) do |user|
  Article.first(3).each { |article| user.like(article) }
end
