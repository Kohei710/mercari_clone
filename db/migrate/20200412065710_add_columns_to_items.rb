class AddColumnsToItems < ActiveRecord::Migration[5.1]
  def change

    add_column :items,:shipping_fee, :integer
  end
end
