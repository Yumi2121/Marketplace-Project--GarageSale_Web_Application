require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get bought" do
    get orders_bought_url
    assert_response :success
  end

  test "should get sold" do
    get orders_sold_url
    assert_response :success
  end
end
