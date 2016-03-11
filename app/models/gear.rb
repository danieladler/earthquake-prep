class Gear < ActiveRecord::Base
  belongs_to :user

  store_accessor :ready, :clothes, :flashlight, :backpack
  store_accessor :food, :water_gal, :food_days, :can_opener, :h20_tablets, :mess_kit, :camp_stove
  store_accessor :utilities, :cash, :batteries, :pocket_radio, :pocket_tool, :matches, :handbook
  store_accessor :medical, :first_aid_kit, :specialty_meds, :glasses
  store_accessor :pet, :pet_crate, :pet_food, :pet_meds
  store_accessor :sanitation, :tp, :toilet_q, :toilet_2, :trash_bags, :sanitizer
  store_accessor :documents, :id, :insurance, :bank, :checks
  store_accessor :shelter, :tent, :sleeping_bag
  store_accessor :clothing, :change, :work_gloves
end
