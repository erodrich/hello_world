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

ActiveRecord::Schema.define(version: 20150921055915) do

  create_table "services", force: :cascade do |t|
    t.string   "addr_from",      limit: 255
    t.string   "addr_to",        limit: 255
    t.date     "date"
    t.time     "time"
    t.integer  "num_passengers", limit: 4
    t.string   "type_vehicle",   limit: 255
    t.string   "payment_method", limit: 255
    t.string   "status",         limit: 255
    t.integer  "user_id",        limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "services", ["user_id", "created_at"], name: "index_services_on_user_id_and_created_at", using: :btree
  add_index "services", ["user_id"], name: "index_services_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "nombre",          limit: 255
    t.string   "apellido",        limit: 255
    t.string   "correo",          limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "admin",                       default: false
    t.boolean  "driver",                      default: false
  end

  add_index "users", ["correo"], name: "index_users_on_correo", unique: true, using: :btree

  add_foreign_key "services", "users"
end
