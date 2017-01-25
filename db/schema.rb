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

ActiveRecord::Schema.define(version: 20170120215821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

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
    t.index ["business_unit_id"], name: "index_chef_configs_on_business_unit_id", using: :btree
  end

  create_table "chef_server_reports", force: :cascade do |t|
    t.integer  "business_unit_id"
    t.integer  "number_of_nodes"
    t.integer  "number_of_users"
    t.integer  "number_of_cookbooks"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["business_unit_id"], name: "index_chef_server_reports_on_business_unit_id", using: :btree
  end

  create_table "competition_results", force: :cascade do |t|
    t.integer  "sporter_id"
    t.integer  "competition_id"
    t.integer  "place"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["competition_id"], name: "index_competition_results_on_competition_id", using: :btree
    t.index ["sporter_id"], name: "index_competition_results_on_sporter_id", using: :btree
  end

  create_table "competitions", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.integer  "business_unit_id"
    t.string   "name"
    t.boolean  "is_user"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["business_unit_id"], name: "index_contacts_on_business_unit_id", using: :btree
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "new_relic_configs", force: :cascade do |t|
    t.integer  "business_unit_id"
    t.string   "account_number"
    t.string   "api_key"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["business_unit_id"], name: "index_new_relic_configs_on_business_unit_id", using: :btree
  end

  create_table "new_relic_reports", force: :cascade do |t|
    t.integer  "business_unit_id"
    t.integer  "number_of_servers"
    t.integer  "number_of_apps"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["business_unit_id"], name: "index_new_relic_reports_on_business_unit_id", using: :btree
  end

  create_table "pager_duty_configs", force: :cascade do |t|
    t.integer  "business_unit_id"
    t.string   "sub_domain"
    t.string   "api_key"
    t.string   "service_api_key"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["business_unit_id"], name: "index_pager_duty_configs_on_business_unit_id", using: :btree
  end

  create_table "pager_duty_incidents", force: :cascade do |t|
    t.integer  "business_unit_id"
    t.string   "pager_duty_id"
    t.integer  "incident_number"
    t.string   "description"
    t.string   "service_id"
    t.string   "service_name"
    t.string   "escalation_policy_id"
    t.datetime "created_on"
    t.datetime "resolved_on"
    t.integer  "seconds_to_first_ack"
    t.integer  "seconds_to_resolve"
    t.integer  "auto_resolved"
    t.integer  "acknowledge_count"
    t.integer  "assignment_count"
    t.string   "acknowledged_by_user_ids"
    t.string   "acknowledged_by_user_names"
    t.string   "resolved_by_user_id"
    t.string   "resolved_by_user_name"
    t.string   "urgency"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["business_unit_id"], name: "index_pager_duty_incidents_on_business_unit_id", using: :btree
  end

  create_table "pager_duty_reports", force: :cascade do |t|
    t.integer  "business_unit_id"
    t.integer  "number_of_incidents"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.boolean  "active"
    t.datetime "start_date"
    t.datetime "end_date"
    t.index ["business_unit_id"], name: "index_pager_duty_reports_on_business_unit_id", using: :btree
  end

  create_table "sporters", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_sporters_on_country_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "chef_configs", "business_units"
  add_foreign_key "chef_server_reports", "business_units"
  add_foreign_key "competition_results", "competitions"
  add_foreign_key "competition_results", "sporters"
  add_foreign_key "contacts", "business_units"
  add_foreign_key "new_relic_configs", "business_units"
  add_foreign_key "new_relic_reports", "business_units"
  add_foreign_key "pager_duty_configs", "business_units"
  add_foreign_key "pager_duty_incidents", "business_units"
  add_foreign_key "pager_duty_reports", "business_units"
  add_foreign_key "sporters", "countries"
end
