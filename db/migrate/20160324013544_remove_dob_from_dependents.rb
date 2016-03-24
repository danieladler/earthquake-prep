class RemoveDobFromDependents < ActiveRecord::Migration
  def change
    remove_column :dependents, :year_of_birth
  end
end
