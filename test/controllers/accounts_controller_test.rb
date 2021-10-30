require "test_helper"

class AccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get "/accounts"
    assert_response :success
  end
end
