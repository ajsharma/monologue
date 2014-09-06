require 'test_helper'

class GithubEventsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    # assert_not_nil assigns(:github_events)
  end

  # test "should show github_event" do
  #   get :show, id: @github_event
  #   assert_response :success
  # end

end
