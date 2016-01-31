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

ActiveRecord::Schema.define(version: 20160131000925) do

  create_table "reservations", force: true do |t|
    t.datetime "start_time"
    t.integer  "party_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "restaurant_id"
    t.datetime "end_time"
    t.string   "name"
    t.integer  "table_id"
  end

  add_index "reservations", ["restaurant_id"], name: "index_reservations_on_restaurant_id"
  add_index "reservations", ["table_id"], name: "index_reservations_on_table_id"

  create_table "restaurants", force: true do |t|
    t.integer  "capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tables", force: true do |t|
    t.integer  "table_type"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "reservation_id"
  end

  add_index "tables", ["reservation_id"], name: "index_tables_on_reservation_id"
  add_index "tables", ["restaurant_id"], name: "index_tables_on_restaurant_id"

end
