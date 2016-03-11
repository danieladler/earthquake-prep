# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160311194424) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "homes", force: :cascade do |t|
    t.integer  "user_id"
    t.jsonb    "structure",  default: {"floors"=>nil, "fdn_bolted"=>nil, "year_built"=>nil, "fdn_material"=>nil, "chimney_material"=>nil, "structure_material"=>nil, "flam_liquids_outside?"=>nil}, null: false
    t.jsonb    "property",   default: {"landslide_risk"=>nil, "liquefaction_risk"=>nil},                                                                                                            null: false
    t.datetime "created_at",                                                                                                                                                                        null: false
    t.datetime "updated_at",                                                                                                                                                                        null: false
  end

  add_index "homes", ["property"], name: "index_homes_on_property", using: :gin
  add_index "homes", ["structure"], name: "index_homes_on_structure", using: :gin

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
