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

ActiveRecord::Schema.define(version: 20150227225608) do

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "destination_itineraries", force: :cascade do |t|
    t.integer  "destination_id"
    t.integer  "itinerary_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "destination_itineraries", ["destination_id"], name: "index_destination_itineraries_on_destination_id"
  add_index "destination_itineraries", ["itinerary_id"], name: "index_destination_itineraries_on_itinerary_id"

  create_table "destination_users", force: :cascade do |t|
    t.integer  "destination_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "destination_users", ["destination_id"], name: "index_destination_users_on_destination_id"
  add_index "destination_users", ["user_id"], name: "index_destination_users_on_user_id"

  create_table "destinations", force: :cascade do |t|
    t.string   "location"
    t.string   "name"
    t.integer  "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itineraries", force: :cascade do |t|
    t.string   "origin"
    t.string   "destination"
    t.string   "name"
    t.integer  "depart_date"
    t.integer  "return_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "itinerary_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "itinerary_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "itinerary_users", ["itinerary_id"], name: "index_itinerary_users_on_itinerary_id"
  add_index "itinerary_users", ["user_id"], name: "index_itinerary_users_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end