class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :transaction
      t.decimal :amount
      t.datetime :date
      t.text :description
      t.references :bank, null: false, foreign_key: true

      t.timestamps
    end
  end
end
