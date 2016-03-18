class RemoveInstructionsFromPreparation < ActiveRecord::Migration
  def change
    remove_column :preparations, :instructions
  end
end
