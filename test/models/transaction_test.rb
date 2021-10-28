require "test_helper"

class TransactionTest < ActiveSupport::TestCase
  test "should not create transaction without amount" do
    transaction = Transaction.new
    transaction.date = "2021-10-21 00:07:37"
    transaction.description = "test description"
    assert_not transaction.save,  "Saved the transaction without an amount"
  end

  test "should not create transaction without date" do
    transaction = Transaction.new
    transaction.amount = "9.99"
    transaction.description = "test description"
    assert_not transaction.save, "Saved the transaction without a date"
  end

  test "should not create transaction without description" do
    transaction = Transaction.new
    transaction.amount = "9.99"
    transaction.date = "2021-10-21 00:07:37"
    assert_not transaction.save, "Saved the transaction without a description"  
  end

end
