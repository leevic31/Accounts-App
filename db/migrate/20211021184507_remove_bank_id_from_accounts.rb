class RemoveBankIdFromAccounts < ActiveRecord::Migration[6.1]
  def change
    remove_column :accounts, :bank_id, :integer
  end
end
