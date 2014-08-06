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

ActiveRecord::Schema.define(version: 20140806173802) do

  create_table "artists", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dj_sets", force: true do |t|
    t.string   "type"
    t.datetime "time_start"
    t.datetime "time_end"
    t.integer  "artist_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dj_sets", ["artist_id"], name: "index_dj_sets_on_artist_id"
  add_index "dj_sets", ["event_id"], name: "index_dj_sets_on_event_id"

  create_table "events", force: true do |t|
    t.datetime "time_start"
    t.datetime "time_end"
    t.integer  "location_id"
    t.integer  "party_date_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["location_id"], name: "index_events_on_location_id"
  add_index "events", ["party_date_id"], name: "index_events_on_party_date_id"

  create_table "locations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "party_dates", force: true do |t|
    t.date     "night_start"
    t.datetime "time_start"
    t.datetime "time_end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
