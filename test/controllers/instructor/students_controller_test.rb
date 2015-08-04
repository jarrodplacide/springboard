require 'test_helper'

class Instructor::StudentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get email" do
    get :email
    assert_response :success
  end

end
