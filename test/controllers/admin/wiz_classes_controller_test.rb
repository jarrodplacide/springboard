require 'test_helper'

class Admin::WizClassesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new_one_time" do
    get :new_one_time
    assert_response :success
  end

  test "should get new_recurring" do
    get :new_recurring
    assert_response :success
  end

end
