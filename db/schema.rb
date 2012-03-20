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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120320050622) do

  create_table "admins", :force => true do |t|
    t.string   "login"
    t.string   "name"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "dining_tables", :force => true do |t|
    t.integer  "tableNumber"
    t.integer  "groupNumber"
    t.integer  "admin_id"
    t.integer  "tableCaptain_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "dining_tables", ["admin_id"], :name => "index_dining_tables_on_admin_id"
  add_index "dining_tables", ["tableCaptain_id"], :name => "index_dining_tables_on_tableCaptain_id"

  create_table "guests", :force => true do |t|
    t.string   "lastName"
    t.string   "firstName"
    t.string   "email"
    t.string   "phone"
    t.boolean  "confirm"
    t.text     "notes"
    t.integer  "diningTable_id"
    t.integer  "tableCaptain_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "guests", ["diningTable_id"], :name => "index_guests_on_diningTable_id"
  add_index "guests", ["tableCaptain_id"], :name => "index_guests_on_tableCaptain_id"

  create_table "table_captains", :force => true do |t|
    t.string   "login"
    t.string   "name"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tables", :force => true do |t|
    t.string   "name"
    t.decimal  "tableNumber"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
