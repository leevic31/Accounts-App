class RemoveBankFkFromAccounts < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :accounts, :banks
  end
end
