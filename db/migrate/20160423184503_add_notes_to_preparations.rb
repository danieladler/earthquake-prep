class AddNotesToPreparations < ActiveRecord::Migration
  def change
    add_column :preparations, :notes, :text
  end
end
