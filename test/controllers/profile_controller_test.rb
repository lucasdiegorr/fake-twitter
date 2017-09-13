require 'test_helper'

class ProfileControllerTest < ActionController::TestCase
  test "should get myprofile" do
    get :myprofile
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
