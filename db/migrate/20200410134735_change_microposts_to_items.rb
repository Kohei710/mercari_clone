class ChangeMicropostsToItems < ActiveRecord::Migration[5.1]
  def change
    rename_table :microposts, :items
  end
end
