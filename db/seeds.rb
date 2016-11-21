commenter = User.create(email: 'user_1@example.com', username: 'user_1',
                        password: '123456', password_confirmation: '123456')

3.times { FactoryGirl.create(:user) }

User.first(3).each { |user| FactoryGirl.create(:article, author: user) }

Article.first(2).each do |article|
  User.first(2).each { |user| Like.create(user: user, article: article) }
  15.times { FactoryGirl.create(:comment, article: article, user: commenter) }
end
