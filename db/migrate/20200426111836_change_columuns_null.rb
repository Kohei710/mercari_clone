class ChangeColumunsNull < ActiveRecord::Migration[5.1]
  def up
    change_column_null :items, :delivery_area, false
    change_column_null :items, :name, false
    change_column_null :items, :price, false
    change_column_null :items, :category, false
    change_column_null :items, :days_to_ship, false
    change_column_null :items, :condition, false
    change_column_null :items, :shipping_fee, false
  end

  def down
    change_column_null :items, :delivery_area, true, nil
    change_column_null :items, :name, true, nil
    change_column_null :items, :price, true, nil
    change_column_null :items, :category, true, nil
    change_column_null :items, :days_to_ship, true, nil
    change_column_null :items, :condition, true, nil
    change_column_null :items, :shipping_fee, true, nil
  end
end
