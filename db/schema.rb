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

ActiveRecord::Schema.define(version: 20130408054001) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "data_sources", force: true do |t|
    t.string   "name"
    t.string   "database_type"
    t.string   "host"
    t.integer  "port"
    t.string   "user"
    t.string   "password"
    t.string   "database_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "queries", force: true do |t|
    t.string   "name"
    t.text     "body"
    t.string   "interpreter"
    t.integer  "data_source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "context",        default: ""
  end

  create_table "queries_users", id: false, force: true do |t|
    t.integer "query_id"
    t.integer "user_id"
  end

  add_index "queries_users", ["query_id", "user_id"], name: "index_queries_users_on_query_id_and_user_id", using: :btree
  add_index "queries_users", ["user_id", "query_id"], name: "index_queries_users_on_user_id_and_query_id", using: :btree

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",               default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
