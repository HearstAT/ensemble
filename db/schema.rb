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

ActiveRecord::Schema.define(version: 20161215213635) do

  create_table "business_units", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chef_configs", force: :cascade do |t|
    t.integer  "business_unit_id"
    t.string   "chef_server_url"
    t.string   "chef_organization"
    t.string   "admins"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["business_unit_id"], name: "index_chef_configs_on_business_unit_id"
  end

  create_table "chef_server_reports", force: :cascade do |t|
    t.integer  "business_unit_id"
    t.integer  "number_of_nodes"
    t.integer  "number_of_users"
    t.integer  "number_of_cookbooks"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["business_unit_id"], name: "index_chef_server_reports_on_business_unit_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.integer  "business_unit_id"
    t.string   "name"
    t.boolean  "is_user"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["business_unit_id"], name: "index_contacts_on_business_unit_id"
  end

  create_table "new_relic_configs", force: :cascade do |t|
    t.integer  "business_unit_id"
    t.string   "account_number"
    t.string   "api_key"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["business_unit_id"], name: "index_new_relic_configs_on_business_unit_id"
  end

  create_table "new_relic_reports", force: :cascade do |t|
    t.integer  "business_unit_id"
    t.integer  "number_of_servers"
    t.integer  "number_of_apps"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["business_unit_id"], name: "index_new_relic_reports_on_business_unit_id"
  end

  create_table "pager_duty_configs", force: :cascade do |t|
    t.integer  "business_unit_id"
    t.string   "sub_domain"
    t.string   "api_key"
    t.string   "service_api_key"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["business_unit_id"], name: "index_pager_duty_configs_on_business_unit_id"
  end

  create_table "pager_duty_reports", force: :cascade do |t|
    t.integer  "business_unit_id"
    t.integer  "number_of_incidents"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["business_unit_id"], name: "index_pager_duty_reports_on_business_unit_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer  "business_unit_id"
    t.string   "name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["business_unit_id"], name: "index_users_on_business_unit_id"
  end

end
