class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :reviewer, foreign_key: { to_table: :users }, null: false
      t.references :reviewed, foreign_key: { to_table: :users }, null: false
      t.references :dealing, foreign_key: true, null: false
      t.integer    :evaluation, null: false

      t.timestamps
    end
    add_index :reviews, [:dealing_id, :reviewer_id], unique: true
    add_index :reviews, [:dealing_id, :reviewed_id], unique: true
  end
end
