class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.string :name
      t.string :email
      t.string :phone
      t.boolean :out_of_town

      t.timestamps null: false
    end
  end
end
