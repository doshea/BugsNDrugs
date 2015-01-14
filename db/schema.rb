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

ActiveRecord::Schema.define(version: 20150114024231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bug_classes", force: :cascade do |t|
    t.string   "name",         limit: 255, null: false
    t.integer  "tier"
    t.integer  "order"
    t.text     "image"
    t.integer  "bug_class_id"
    t.boolean  "pending"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "bugs", force: :cascade do |t|
    t.string   "name",              limit: 255,                 null: false
    t.string   "common_name",       limit: 255
    t.string   "gram_stain",        limit: 255
    t.string   "environment",       limit: 255
    t.string   "morphology",        limit: 255
    t.string   "growth_pattern",    limit: 255
    t.text     "description"
    t.string   "brief_description", limit: 255
    t.text     "toxins"
    t.integer  "order"
    t.text     "image"
    t.boolean  "motile",                        default: false
    t.boolean  "encapsulated",                  default: false
    t.boolean  "pending"
    t.integer  "bug_class_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "diseases",                      default: [],                 array: true
    t.text     "treatments",                    default: [],                 array: true
    t.string   "tests"
  end

  create_table "drug_classes", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "tier"
    t.text     "description"
    t.integer  "order"
    t.integer  "drug_class_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drugs", force: :cascade do |t|
    t.string   "generic_name",   limit: 255, null: false
    t.string   "chemical_name",  limit: 255
    t.string   "trade_name",     limit: 255
    t.text     "mechanism"
    t.string   "administered",   limit: 255
    t.string   "metabolized_in", limit: 255
    t.boolean  "csf"
    t.string   "toxicities",     limit: 255
    t.boolean  "obscure"
    t.boolean  "pending"
    t.integer  "drug_class_id"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "side_effects", id: false, force: :cascade do |t|
    t.integer "drug_id"
    t.integer "effectable_id"
    t.string  "effectable_type", limit: 255
  end

  create_table "symptoms", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.text     "image"
    t.boolean  "pending"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "syndromes", force: :cascade do |t|
    t.boolean  "pending"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "systems", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "treatments", force: :cascade do |t|
    t.integer "drug_id"
    t.integer "treatable_id"
    t.integer "treatable_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.string   "email",           limit: 255
    t.string   "username",        limit: 255
    t.boolean  "is_admin"
    t.string   "password_digest", limit: 255
    t.text     "image"
    t.string   "auth_token",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
