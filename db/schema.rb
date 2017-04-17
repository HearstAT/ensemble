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

ActiveRecord::Schema.define(version: 20170417183641) do

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

  create_table "contacts", force: :cascade do |t|
    t.integer  "business_unit_id"
    t.string   "name"
    t.boolean  "is_user"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["business_unit_id"], name: "index_contacts_on_business_unit_id", using: :btree
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "domains", force: :cascade do |t|
    t.string   "domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "new_relic_applications", force: :cascade do |t|
    t.integer  "new_relic_config_id"
    t.integer  "new_relic_application_id"
    t.string   "name"
    t.string   "language"
    t.string   "health_status"
    t.boolean  "reporting"
    t.datetime "last_reported_at"
    t.decimal  "response_time"
    t.decimal  "throughput"
    t.decimal  "error_rate"
    t.decimal  "apdex_target"
    t.decimal  "apdex_score"
    t.integer  "host_count"
    t.integer  "instance_count"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["new_relic_config_id"], name: "index_new_relic_applications_on_new_relic_config_id", using: :btree
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
    t.string   "escalation_policy_name"
    t.integer  "escalation_count"
    t.integer  "auto_escalation_count"
    t.string   "assigned_to_user_ids"
    t.string   "assigned_to_user_names"
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

  create_table "pager_duty_services", force: :cascade do |t|
    t.integer  "pager_duty_config_id"
    t.string   "pager_duty_service_id"
    t.string   "name"
    t.boolean  "display",               default: true
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["pager_duty_config_id"], name: "index_pager_duty_services_on_pager_duty_config_id", using: :btree
  end

  create_table "user_business_units", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "business_unit_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["business_unit_id"], name: "index_user_business_units_on_business_unit_id", using: :btree
    t.index ["user_id"], name: "index_user_business_units_on_user_id", using: :btree
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
    t.boolean  "admin"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "chef_configs", "business_units"
  add_foreign_key "chef_server_reports", "business_units"
  add_foreign_key "contacts", "business_units"
  add_foreign_key "new_relic_applications", "new_relic_configs"
  add_foreign_key "new_relic_configs", "business_units"
  add_foreign_key "new_relic_reports", "business_units"
  add_foreign_key "pager_duty_configs", "business_units"
  add_foreign_key "pager_duty_incidents", "business_units"
  add_foreign_key "pager_duty_reports", "business_units"
  add_foreign_key "pager_duty_services", "pager_duty_configs"
end
