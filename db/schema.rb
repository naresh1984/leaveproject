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

ActiveRecord::Schema.define(:version => 20131001061928) do

  create_table "admin_high_scores", :force => true do |t|
    t.string   "game"
    t.integer  "score"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "admin_locations", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "employees", :force => true do |t|
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "empid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "manager_id"
    t.string   "contact_no"
    t.text     "address"
    t.integer  "createdby"
    t.integer  "modifiedby"
    t.integer  "location_id"
  end

  create_table "employees_roles", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "role_id"
    t.integer  "createdby"
    t.string   "modifiedby"
    t.string   "title"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "leave_requests", :force => true do |t|
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "employee_id"
    t.date     "fromdate"
    t.date     "todate"
    t.integer  "numdays"
    t.date     "resumeon"
    t.string   "reason"
    t.string   "contactno"
    t.text     "address"
    t.string   "currentproject"
    t.integer  "managerid"
    t.string   "remarks"
    t.integer  "createdby"
    t.integer  "modifiedby"
    t.string   "status"
  end

  create_table "leaves", :force => true do |t|
    t.integer "employee_id"
    t.float   "els",         :default => 0.0
    t.float   "nels",        :default => 0.0
    t.float   "lops",        :default => 0.0
    t.float   "compoffs",    :default => 0.0
    t.float   "is_special",  :default => 0.0
    t.integer "createdby"
    t.integer "modifiedby"
  end

  create_table "leaves_audit_logs", :force => true do |t|
    t.integer  "employee_id"
    t.float    "preels",           :default => 0.0
    t.float    "prenels",          :default => 0.0
    t.float    "prelops",          :default => 0.0
    t.float    "precompoffs",      :default => 0.0
    t.float    "currentels",       :default => 0.0
    t.float    "currentnels",      :default => 0.0
    t.float    "currentlops",      :default => 0.0
    t.float    "currentcompoffs",  :default => 0.0
    t.string   "tableorscreen"
    t.integer  "tableid"
    t.integer  "premodifiedby"
    t.integer  "recentmodifiedby"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "processed_leaves", :force => true do |t|
    t.integer  "leave_request_id"
    t.float    "els",              :default => 0.0
    t.float    "nels",             :default => 0.0
    t.float    "lops",             :default => 0.0
    t.float    "compoffs",         :default => 0.0
    t.integer  "processed_by"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
