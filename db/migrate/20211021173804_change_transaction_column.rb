class ChangeTransactionColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :transactions, :date, :date
  end
end
