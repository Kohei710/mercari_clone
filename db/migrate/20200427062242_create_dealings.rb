class CreateDealings < ActiveRecord::Migration[5.1]
  def change
    create_table :dealings do |t|
      t.references :item, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.integer :status, default: 1, null: false

      t.timestamps
    end
  end
end
