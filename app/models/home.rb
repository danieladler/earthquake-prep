class Home < ActiveRecord::Base
  belongs_to :user

  store_accessor :strucutre, :year_built, :floors, :structure_material, :fdn_material, :fdn_bolted, :chimney_material, :flam_liquids_outside?
  store_accessor :property, :landslide_risk, :liquefaction_risk
end
