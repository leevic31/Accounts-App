require "test_helper"

class BankTest < ActiveSupport::TestCase
  test "should not create bank without name" do
    bank = Bank.new
    assert_not bank.save, "Saved the bank without a name"
  end

end
