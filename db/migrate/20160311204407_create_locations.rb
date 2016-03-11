class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :user_id
      t.string :route_type # home route set or work route set
      t.string :safe_loc
      t.string :evac_plan
      t.string :meetup_point
      t.string :route_to_hospital
      t.string :route_to_fire_stn
      t.string :route_to_police

      t.timestamps null: false
    end
  end
end
