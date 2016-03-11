class CreateGears < ActiveRecord::Migration
  def change
    create_table :gears do |t|
      t.integer :user_id
      t.jsonb :ready, null: false, default: {clothes: nil, flashlight:nil, backpack:nil}
      t.jsonb :food, null: false, default: {water_gal: 0, food_days: 0, can_opener: nil, h20_tablets: nil, mess_kit: nil, camp_stove: nil}
      t.jsonb :utilities, null: false, default: {cash: 0, batteries: nil, pocket_radio: nil, pocket_tool: nil, matches: nil, handbook: nil}
      t.jsonb :medical, null: false, default: {first_aid_kit: nil, specialty_meds: nil, glasses: nil}
      t.jsonb :pet, null: false, default: {pet_crate: nil, pet_food: nil, pet_meds: nil}
      t.jsonb :sanitation, null: false, default: {tp: nil, toilet_1: nil, toilet_2: nil, trash_bags: nil, sanitizer: nil}
      t.jsonb :documents, null: false, default: {id: nil, insurance: nil, bank: nil, checks: nil}
      t.jsonb :shelter, null: false, default: {tent: nil, sleeping_bag: nil}
      t.jsonb :clothing, null: false, default: {change: nil, work_gloves: nil}

      t.timestamps null: false
    end

    add_index :gears, :ready, using: :gin
    add_index :gears, :food, using: :gin
    add_index :gears, :utilities, using: :gin
    add_index :gears, :medical, using: :gin
    add_index :gears, :pet, using: :gin
    add_index :gears, :sanitation, using: :gin
    add_index :gears, :documents, using: :gin
    add_index :gears, :shelter, using: :gin
    add_index :gears, :clothing, using: :gin
  end
end
