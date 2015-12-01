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

ActiveRecord::Schema.define(version: 20151201001118) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "api_keys", force: :cascade do |t|
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spatial_ref_sys", primary_key: "srid", force: :cascade do |t|
    t.string  "auth_name", limit: 256
    t.integer "auth_srid"
    t.string  "srtext",    limit: 2048
    t.string  "proj4text", limit: 2048
  end

  create_table "taxi_driver_locations", force: :cascade do |t|
    t.integer  "taxi_driver_id",                         null: false
    t.decimal  "latitude",       precision: 9, scale: 6, null: false
    t.decimal  "longitude",      precision: 9, scale: 6, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "taxi_driver_locations", ["taxi_driver_id"], name: "index_taxi_driver_locations_on_taxi_driver_id", using: :btree

  create_table "taxi_drivers", force: :cascade do |t|
    t.string   "name",                          null: false
    t.string   "license_plate",                 null: false
    t.boolean  "available",     default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "taxi_drivers", ["name"], name: "index_taxi_drivers_on_name", using: :btree

  add_foreign_key "taxi_driver_locations", "taxi_drivers"
end
