require 'test_helper'

class Student::StaticPagesControllerTest < ActionController::TestCase
  test "should get verification_required" do
    get :verification_required
    assert_response :success
  end

end
