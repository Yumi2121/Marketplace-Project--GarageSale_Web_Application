require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get items_home_url
    assert_response :success
  end

  test "should get restricted" do
    get items_restricted_url
    assert_response :success
  end
end
