ENV['RAILS_ENV'] ||= 'test'
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

OmniAuth.config.test_mode = true

# github_omniauth_hash = {
#   'provider' => 'github',
#   'uid' => Faker::Number.number(10),
#   'info' => {
#     'name' => Faker::Name.name,
#     'email' => Faker::Internet.email,
#     'nickname' => Faker::Internet.user_name
#   },
#   'extra' => {
#     'raw_info' => {
#       'location' => 'San Francisco',
#       'gravatar_id' => '123456789'
#     }
#   }
# }

# OmniAuth.config.add_mock(:github, github_omniauth_hash)
