require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase

  def add_omniauth_mock user
    github_omniauth_hash = {
      'provider' => 'github',
      'uid' => Faker::Number.number(10),
      'info' => {
        'name' => user.name,
        'email' => Faker::Internet.email,
        'nickname' => Faker::Internet.user_name
      },
      'extra' => {
        'raw_info' => {
          'location' => 'San Francisco',
          'gravatar_id' => Faker::Number.number(10)
        }
      }
    }

    OmniAuth.config.add_mock(:github, github_omniauth_hash)
  end

  def sign_in user
    add_omniauth_mock user
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:github]
  end
end
