class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.integer :user_id
      t.jsonb :structure, null: false, default: {year_built: nil, floors: nil, structure_material: nil, fdn_material:nil, fdn_bolted: nil, chimney_material: nil, flam_liquids_outside?: nil}
      t.jsonb :property, null: false, default: {landslide_risk: nil, liquefaction_risk: nil}

      t.timestamps null: false
    end

    add_index :homes, :structure, using: :gin
    add_index :homes, :property, using: :gin
  end
end
