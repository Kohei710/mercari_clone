class ChangeColumunsNull < ActiveRecord::Migration[5.1]
  def up
    change_column_null :items, :delivery_area, false, 0
    change_column_null :items, :name, false, 0
    change_column_null :items, :price, false, 0
    change_column_null :items, :category, false, 0
    change_column_null :items, :days_to_ship, false, 0
    change_column_null :items, :condition, false, 0
    change_column_null :items, :shipping_fee, false, 0
    change_column :items, :shipping_fee, :integer, default: 1
  end

  def down
    change_column_null :items, :delivery_area, true, nil
    change_column_null :items, :name, true, nil
    change_column_null :items, :price, true, nil
    change_column_null :items, :category, true, nil
    change_column_null :items, :days_to_ship, true, nil
    change_column_null :items, :condition, true, nil
    change_column_null :items, :shipping_fee, true, nil
    change_column :items, :shipping_fee, :integer, default: nil
  end
end
