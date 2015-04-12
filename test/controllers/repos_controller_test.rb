require 'test_helper'

class ReposControllerTest < ApplicationControllerTest

  def setup
    @user = FactoryGirl.create :user, :with_repos
    @controller.current_user = @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:repos)
  end

  test "should show repo" do
    get :show, id: @user.repos.first.id
    assert_response :success
  end

end
