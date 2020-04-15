class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :item, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :delivery_status, default: 1

      t.timestamps
    end
  end
end
