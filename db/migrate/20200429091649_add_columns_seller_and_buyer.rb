class AddColumnsSellerAndBuyer < ActiveRecord::Migration[5.1]
  def change
    add_reference :dealings, :seller, foreign_key: { to_table: :users }
    add_reference :dealings, :buyer,  foreign_key: { to_table: :users }
    change_column_null :dealings, :seller_id, false
    change_column_null :dealings, :buyer_id,  false
    remove_foreign_key :dealings, :users
    remove_reference :dealings, :user, index: true, foreign_key: true
  end
end
