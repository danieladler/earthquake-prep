class AddColumnsToHomes < ActiveRecord::Migration
  def change
    add_column :homes, :street_address, :string
    add_column :homes, :city, :string
    add_column :homes, :state, :string
    add_column :homes, :zip, :string
    add_column :homes, :is_house?, :boolean
  end
end
