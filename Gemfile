source 'https://rubygems.org'


gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

# Views
gem 'simple_form'
gem 'slim'
gem 'bootstrap-sass'

# Other gems
gem 'devise'
gem 'draper', github: 'audionerd/draper', branch: 'rails5'
gem 'decent_decoration', '~> 0.1.0'
gem 'decent_exposure', '3.0.0'
# Draper Rails5 issue
gem 'activemodel-serializers-xml', git: 'https://github.com/rails/activemodel-serializers-xml'
gem 'pundit'
gem 'responders'

group :test do
  gem 'capybara'
  gem 'formulaic'
  gem 'email_spec'
  gem 'shoulda-matchers'
  gem 'codeclimate-test-reporter', require: false
end

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'rspec-its'
  gem 'factory_girl_rails'
  gem 'dotenv-rails'
  gem 'faker'
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'slim-rails'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
