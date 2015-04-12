require 'test_helper'

class SessionsControllerTest < ApplicationControllerTest

  def setup
  end

  test "should create user" do
    assert_difference('User.count') do
      sign_in FactoryGirl.build( :user )
      get :create, provider: :github
    end
  end

end
