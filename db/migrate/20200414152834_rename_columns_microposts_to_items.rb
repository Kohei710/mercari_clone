class RenameColumnsMicropostsToItems < ActiveRecord::Migration[5.1]
  def change
    rename_column :comments, :micropost_id, :item_id
    rename_column :likes, :micropost_id, :item_id
    rename_column :reviews, :micropost_id, :item_id
  end
end
