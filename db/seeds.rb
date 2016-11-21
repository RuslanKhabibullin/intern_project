commenter = User.create(email: 'ruslan@email.com', username: 'willfarm',
                        password: 'muchPass1', password_confirmation: 'muchPass1')

3.times { FactoryGirl.create(:user) }

User.first(3).each { |user| FactoryGirl.create(:article, author: user) }

Article.first(2).each do |article|
  User.first(2).each { |user| Like.create(user: user, article: article) }
  15.times { FactoryGirl.create(:comment, article: article, user: commenter) }
end
