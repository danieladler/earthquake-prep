class AddColumnsToPreparations < ActiveRecord::Migration
  def change
    add_column :preparations, :est_cost, :integer
    add_column :preparations, :est_time, :integer
    add_column :preparations, :completed_at, :datetime
  end
end
