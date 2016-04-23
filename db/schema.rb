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

ActiveRecord::Schema.define(version: 20160423184503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.boolean  "out_of_town"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "dependents", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "human"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gears", force: :cascade do |t|
    t.integer  "user_id"
    t.jsonb    "ready",      default: {"clothes"=>nil, "backpack"=>nil, "flashlight"=>nil},                                                        null: false
    t.jsonb    "food",       default: {"mess_kit"=>nil, "food_days"=>0, "water_gal"=>0, "camp_stove"=>nil, "can_opener"=>nil, "h20_tablets"=>nil}, null: false
    t.jsonb    "utilities",  default: {"cash"=>0, "matches"=>nil, "handbook"=>nil, "batteries"=>nil, "pocket_tool"=>nil, "pocket_radio"=>nil},     null: false
    t.jsonb    "medical",    default: {"glasses"=>nil, "first_aid_kit"=>nil, "specialty_meds"=>nil},                                               null: false
    t.jsonb    "pet",        default: {"pet_food"=>nil, "pet_meds"=>nil, "pet_crate"=>nil},                                                        null: false
    t.jsonb    "sanitation", default: {"tp"=>nil, "toilet_1"=>nil, "toilet_2"=>nil, "sanitizer"=>nil, "trash_bags"=>nil},                          null: false
    t.jsonb    "documents",  default: {"id"=>nil, "bank"=>nil, "checks"=>nil, "insurance"=>nil},                                                   null: false
    t.jsonb    "shelter",    default: {"tent"=>nil, "sleeping_bag"=>nil},                                                                          null: false
    t.jsonb    "clothing",   default: {"change"=>nil, "work_gloves"=>nil},                                                                         null: false
    t.datetime "created_at",                                                                                                                       null: false
    t.datetime "updated_at",                                                                                                                       null: false
  end

  add_index "gears", ["clothing"], name: "index_gears_on_clothing", using: :gin
  add_index "gears", ["documents"], name: "index_gears_on_documents", using: :gin
  add_index "gears", ["food"], name: "index_gears_on_food", using: :gin
  add_index "gears", ["medical"], name: "index_gears_on_medical", using: :gin
  add_index "gears", ["pet"], name: "index_gears_on_pet", using: :gin
  add_index "gears", ["ready"], name: "index_gears_on_ready", using: :gin
  add_index "gears", ["sanitation"], name: "index_gears_on_sanitation", using: :gin
  add_index "gears", ["shelter"], name: "index_gears_on_shelter", using: :gin
  add_index "gears", ["utilities"], name: "index_gears_on_utilities", using: :gin

  create_table "homes", force: :cascade do |t|
    t.integer  "user_id"
    t.jsonb    "structure",      default: {"floors"=>nil, "fdn_bolted"=>nil, "year_built"=>nil, "fdn_material"=>nil, "chimney_material"=>nil, "structure_material"=>nil, "flam_liquids_outside?"=>nil}, null: false
    t.jsonb    "property",       default: {"landslide_risk"=>nil, "liquefaction_risk"=>nil},                                                                                                            null: false
    t.datetime "created_at",                                                                                                                                                                            null: false
    t.datetime "updated_at",                                                                                                                                                                            null: false
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.boolean  "is_house"
  end

  add_index "homes", ["property"], name: "index_homes_on_property", using: :gin
  add_index "homes", ["structure"], name: "index_homes_on_structure", using: :gin

  create_table "locations", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "route_type"
    t.string   "safe_loc"
    t.string   "evac_plan"
    t.string   "meetup_point"
    t.string   "route_to_hospital"
    t.string   "route_to_fire_stn"
    t.string   "route_to_police"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "preparations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "prep_id"
    t.string   "prep_type"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "est_cost"
    t.integer  "est_time"
    t.datetime "completed_at"
    t.boolean  "completed",    default: false
    t.integer  "question_id"
    t.text     "notes"
  end

  add_index "preparations", ["user_id", "prep_id", "prep_type"], name: "index_preparations_on_user_id_and_prep_id_and_prep_type", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "keyword"
    t.string   "contents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "username"
    t.string   "password_digest"
  end

end
