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

ActiveRecord::Schema.define(version: 20150824132016) do

  create_table "comments", force: :cascade do |t|
    t.integer  "ticket_id",  limit: 4
    t.text     "body",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "email_processors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homes", force: :cascade do |t|
    t.string   "code_name",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "provider",   limit: 255
    t.string   "uid",        limit: 255
    t.text     "auth_data",  limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "payment_details", force: :cascade do |t|
    t.integer  "plan_id",        limit: 4
    t.string   "transaction_id", limit: 255
    t.string   "plan_name",      limit: 255
    t.float    "amount",         limit: 24
    t.string   "mihpayid",       limit: 255
    t.integer  "payumoneyid",    limit: 4
    t.string   "payment_status", limit: 255
    t.text     "txn_response",   limit: 65535
    t.datetime "txn_added_on"
    t.string   "payee_mob_no",   limit: 255
    t.string   "payee_email",    limit: 255
    t.string   "checksum",       limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "user_id",        limit: 4
  end

  create_table "plans", force: :cascade do |t|
    t.string   "plan_name",    limit: 255
    t.integer  "ticket_limit", limit: 4
    t.integer  "validity",     limit: 4
    t.integer  "base_amount",  limit: 4
    t.float    "service_tax",  limit: 24
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text     "body",       limit: 65535
    t.string   "email",      limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "user_id",               limit: 4
    t.string   "crn",                   limit: 255
    t.string   "msp_name",              limit: 255
    t.string   "client",                limit: 255
    t.string   "participant_name",      limit: 255
    t.string   "participant_mobile_no", limit: 255
    t.string   "participant_email",     limit: 255
    t.string   "category",              limit: 255,   default: "",    null: false
    t.text     "description",           limit: 65535
    t.string   "forwarded_to",          limit: 255
    t.string   "age_of_complaint",      limit: 255
    t.string   "remark",                limit: 255
    t.string   "resolution_period",     limit: 255
    t.string   "status",                limit: 255,   default: "New", null: false
    t.string   "priority",              limit: 255,   default: "",    null: false
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "client_id",    limit: 4
    t.integer  "user_id",      limit: 4
    t.string   "client_name",  limit: 255
    t.string   "email",        limit: 255
    t.string   "mobile_no",    limit: 255
    t.integer  "plan_id",      limit: 4
    t.string   "plan_name",    limit: 255
    t.float    "total_amount", limit: 24
    t.string   "hash_val",     limit: 255
    t.string   "txn_id",       limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "user_plan_details", force: :cascade do |t|
    t.integer  "plan_id",           limit: 4
    t.integer  "payment_detail_id", limit: 4
    t.integer  "user_id",           limit: 4
    t.integer  "ticket_count",      limit: 4
    t.integer  "validity",          limit: 4
    t.date     "valid_from"
    t.date     "valid_to"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstname",              limit: 255, default: "",    null: false
    t.string   "lastname",               limit: 255, default: "",    null: false
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "mobile_no",              limit: 255, default: "",    null: false
    t.string   "address_1",              limit: 255, default: "",    null: false
    t.string   "role",                   limit: 255
    t.boolean  "is_admin",               limit: 1,   default: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.boolean  "configuration_status",   limit: 1,   default: false
    t.string   "code_name",              limit: 255
    t.string   "customer_care_code",     limit: 255
    t.string   "customer_care_number",   limit: 255
    t.string   "customer_care_email",    limit: 255
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "company_name",           limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

end
