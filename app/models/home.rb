class Home < ActiveRecord::Base
  belongs_to :user
  has_many :preparations, as: :prep

  store_accessor :strucutre, :year_built, :floors, :structure_material, :fdn_material, :fdn_bolted, :chimney_material, :flam_liquids_outside?
  store_accessor :property, :landslide_risk, :liquefaction_risk

  def update_db_values(params)
    self.structure["floors"]     = params["floor_count"].to_i
    self.structure["year_built"] = params["year_built"].to_i
    self.street_address          = params[:street_address]
    self.city                    = params[:city]
    self.state                   = params[:state]
    self.zip                     = params[:zip]
  end

  def remove_non_apt_fields(params)
    self.structure.delete("fdn_bolted")
    self.structure.delete("fdn_material")
    self.structure.delete("chimney_material")
    self.structure.delete("structure_material")
  end
end
