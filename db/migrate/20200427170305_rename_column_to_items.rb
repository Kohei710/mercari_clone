class RenameColumnToItems < ActiveRecord::Migration[5.1]
  def change
    rename_column :items, :delivery_area, :seller_area
  end
end
