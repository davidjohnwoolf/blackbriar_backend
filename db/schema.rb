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

ActiveRecord::Schema.define(version: 20141130202916) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "name",          null: false
    t.string   "email",         null: false
    t.string   "password_hash", null: false
    t.string   "password_salt", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.integer  "user_id"
    t.string   "name",                           null: false
    t.string   "address",                        null: false
    t.string   "city",                           null: false
    t.string   "state",                          null: false
    t.string   "zip",                            null: false
    t.string   "phone",                          null: false
    t.string   "credit_grade",                   null: false
    t.string   "tech_name",                      null: false
    t.string   "package",                        null: false
    t.decimal  "mmr",                            null: false
    t.date     "date_sold",                      null: false
    t.date     "date_installed",                 null: false
    t.boolean  "sixty_month",    default: false
    t.boolean  "eft",            default: false
    t.boolean  "activation",     default: false
    t.boolean  "takeover",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["user_id"], name: "index_customers_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_hash",   null: false
    t.string   "password_salt",   null: false
    t.string   "profile_picture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
