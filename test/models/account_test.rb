require "test_helper"

class AccountTest < ActiveSupport::TestCase
  test "should not create account without name" do
    account = Account.new
    assert_not account.save, "Saved the account without a name"
  end
end
