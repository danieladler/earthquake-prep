class CreateDependents < ActiveRecord::Migration
  def change
    create_table :dependents do |t|
      t.integer :user_id
      t.boolean :human
      t.string :name
      t.integer :year_of_birth

      t.timestamps null: false
    end
  end
end
