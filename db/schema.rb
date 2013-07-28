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

ActiveRecord::Schema.define(version: 20120520101326) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_games", force: true do |t|
    t.integer  "game_id"
    t.integer  "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accounts", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true, using: :btree
  add_index "accounts", ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true, using: :btree

  create_table "countries", force: true do |t|
    t.string   "code"
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "editions", force: true do |t|
    t.integer "game_id"
    t.integer "editor_id"
    t.string  "lang"
    t.string  "plateform"
    t.date    "out_date"
    t.string  "kind"
    t.string  "name"
  end

  create_table "editors", force: true do |t|
    t.string  "name"
    t.string  "url"
    t.string  "lang"
    t.integer "country_id"
    t.string  "logo"
  end

  create_table "games", force: true do |t|
    t.integer  "min"
    t.integer  "max"
    t.string   "name"
    t.string   "target"
    t.string   "time"
    t.integer  "level",             default: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "base_game_id"
    t.boolean  "standalone",        default: false
    t.integer  "active_edition_id"
  end

  create_table "images", force: true do |t|
    t.string   "image"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "people", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "works", force: true do |t|
    t.integer  "person_id"
    t.integer  "game_id"
    t.string   "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
