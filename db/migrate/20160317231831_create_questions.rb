class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :keyword
      t.string :contents

      t.timestamps null: false
    end
  end
end
