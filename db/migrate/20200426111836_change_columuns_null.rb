class ChangeColumunsNull < ActiveRecord::Migration[5.1]
  def change
    change_column_null :items, :delivery_area, null: false
    change_column_null :items, :name, null: false
    change_column_null :items, :price, null: false
    change_column_null :items, :category, null: false
    change_column_null :items, :days_to_ship, null: false
    change_column_null :items, :condition, null: false
    change_column_null :items, :shipping_fee, null: false
  end
end
