class ChangePrepCompletedFormat < ActiveRecord::Migration
  def change
    rename_column :preparations, :completed?, :completed
  end
end
