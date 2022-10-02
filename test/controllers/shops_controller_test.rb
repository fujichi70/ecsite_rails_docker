require "test_helper"

class ShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get resource" do
    get shops_resource_url
    assert_response :success
  end
end
