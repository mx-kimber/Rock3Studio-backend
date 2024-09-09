# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_09_09_223329) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "photos", force: :cascade do |t|
    t.bigint "rock_id", null: false
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rock_id"], name: "index_photos_on_rock_id"
  end

  create_table "rocks", force: :cascade do |t|
    t.string "rock_name"
    t.string "type"
    t.decimal "weight"
    t.string "location"
    t.decimal "price"
    t.date "date_acquired"
    t.text "notes"
    t.string "color"
    t.string "condition"
    t.string "dimensions"
    t.string "source"
    t.string "category"
    t.decimal "hardness"
    t.string "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "weight_unit"
  end

  add_foreign_key "photos", "rocks"
end
