class AddColumnsSellerAndBuyer < ActiveRecord::Migration[5.1]
  def change
    add_reference :dealings, :seller, foreign_key: { to_table: :users }
    add_reference :dealings, :buyer, foreign_key: { to_table: :users }
    remove_foreign_key :dealings, :users
    remove_index :dealings, :user_id
    remove_reference :dealings, :user
  end
end
