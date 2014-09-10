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

ActiveRecord::Schema.define(version: 20140910124219) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bug_classes", force: true do |t|
    t.string   "name",          null: false
    t.integer  "order"
    t.integer  "superclass_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bugs", force: true do |t|
    t.string   "name",              null: false
    t.string   "gram_stain"
    t.string   "environment"
    t.string   "morphology"
    t.string   "growth_pattern"
    t.text     "description"
    t.string   "brief_description"
    t.text     "toxins"
    t.integer  "order"
    t.integer  "bug_class_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "username"
    t.boolean  "is_admin"
    t.string   "password_digest"
    t.string   "image"
    t.string   "auth_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
