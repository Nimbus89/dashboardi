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

ActiveRecord::Schema.define(version: 20131223193400) do

  create_table "pages", force: true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "panel_fields", force: true do |t|
    t.string   "name"
    t.string   "field_type"
    t.integer  "panel_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "panel_fields", ["panel_type_id"], name: "index_panel_fields_on_panel_type_id"

  create_table "panel_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sizex"
    t.integer  "sizey"
  end

  create_table "panels", force: true do |t|
    t.string   "x"
    t.string   "y"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "panel_type_id"
    t.text     "properties"
  end

  add_index "panels", ["page_id"], name: "index_panels_on_page_id"

  create_table "projects", force: true do |t|
    t.string   "name"
    t.datetime "date_created"
    t.datetime "last_modified"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "protocol"
    t.string   "connection_address"
  end

  create_table "properties", force: true do |t|
    t.string   "value"
    t.integer  "panel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "properties", ["panel_id"], name: "index_properties_on_panel_id"

  create_table "property_types", force: true do |t|
    t.string   "name"
    t.string   "value_type"
    t.integer  "panel_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "property_types", ["panel_type_id"], name: "index_property_types_on_panel_type_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
