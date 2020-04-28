class AddColumnItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items,:delivery_area, :integer
  end
end
