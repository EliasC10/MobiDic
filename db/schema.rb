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

ActiveRecord::Schema.define(version: 20180514171605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_entries", force: :cascade do |t|
    t.integer "client_id"
    t.integer "entry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.date "date_of_birth"
    t.integer "institution_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_female"
  end

  create_table "entries", force: :cascade do |t|
    t.datetime "timestamp"
    t.text "text"
    t.integer "supervisor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entry_categories", force: :cascade do |t|
    t.integer "entry_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institutions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supervisors", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.integer "institution_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "client_entries", "clients"
  add_foreign_key "client_entries", "entries"
  add_foreign_key "clients", "institutions"
  add_foreign_key "entries", "supervisors"
  add_foreign_key "entry_categories", "categories"
  add_foreign_key "entry_categories", "entries"
  add_foreign_key "supervisors", "institutions"
end
