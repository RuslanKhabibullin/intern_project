ENV["RAILS_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require "spec_helper"
require "rspec/rails"
Dir[Rails.root.join("spec/support/**/*.rb")].each { |file| require file }
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include Capybara::DSL
end
