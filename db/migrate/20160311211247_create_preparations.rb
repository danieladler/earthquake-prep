class CreatePreparations < ActiveRecord::Migration
  def change
    create_table :preparations do |t|
      t.integer :user_id
      t.integer :prep_id
      t.string :prep_type
      t.string :instructions

      t.timestamps null: false
    end
    add_index :preparations, [:user_id, :prep_id, :prep_type]
  end
end
