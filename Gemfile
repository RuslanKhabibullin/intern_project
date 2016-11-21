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
gem 'bootstrap-sass'
gem 'simple_form'
gem 'slim'

# Other gems
gem 'devise'
gem 'draper', github: 'audionerd/draper', branch: 'rails5'
gem 'decent_decoration', '~> 0.1.0'
gem 'decent_exposure', '3.0.0'
gem 'pundit'
gem 'kaminari', github: 'amatsuda/kaminari'
gem 'interactor'
gem 'responders'
# Draper Rails5 issue
gem 'activemodel-serializers-xml'

group :test do
  gem 'capybara'
  gem 'codeclimate-test-reporter', require: false
  gem 'email_spec'
  gem 'formulaic'
  gem 'shoulda-matchers'
end

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'brakeman', require: false
  gem 'bundler-audit', require: false
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'rspec-its'
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'scss_lint', require: false
  gem 'slim_lint', require: false
end

group :development do
  gem 'foreman', require: false
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'slim-rails'
  gem 'web-console'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
