class AddColumnsItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items,:name, :string
    add_column :items,:price, :integer
    add_column :items,:category, :integer
    add_column :items,:days_to_ship, :integer
    add_column :items,:condition, :integer

  end
end
