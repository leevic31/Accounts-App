class RemoveTransactionFromTransactions < ActiveRecord::Migration[6.1]
  def change
    remove_column :transactions, :transaction, :string
  end
end
