class AddStatusToPreparations < ActiveRecord::Migration
  def change
    add_column :preparations, :completed?, :boolean, default: false
  end
end
