class ChangeHomeIsHouseColumnName < ActiveRecord::Migration
  def change
    rename_column :homes, :is_house?, :is_house
  end
end
