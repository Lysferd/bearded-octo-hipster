require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get live" do
    get :live
    assert_response :success
  end

end
