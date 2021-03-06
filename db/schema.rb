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

ActiveRecord::Schema.define(version: 20150805001900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",           null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "canonical_name"
  end

  add_index "categories", ["name"], name: "index_categories_on_name", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "game_id",    null: false
    t.text     "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendings", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "friend_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string   "name",           null: false
    t.integer  "category_id"
    t.text     "description",    null: false
    t.integer  "min_players"
    t.integer  "max_players"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "canonical_name", null: false
  end

  add_index "games", ["max_players"], name: "index_games_on_max_players", using: :btree
  add_index "games", ["min_players"], name: "index_games_on_min_players", using: :btree
  add_index "games", ["name"], name: "index_games_on_name", using: :btree

  create_table "user_games", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "game_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",               null: false
    t.string   "username",           null: false
    t.string   "email",              null: false
    t.string   "password_hash"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "canonical_username", null: false
    t.string   "canonical_name",     null: false
  end

  add_index "users", ["name"], name: "index_users_on_name", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end
