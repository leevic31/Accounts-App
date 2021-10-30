require "test_helper"

class BanksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get "/banks"
    assert_response :success
  end
end
