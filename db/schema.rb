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

ActiveRecord::Schema[7.0].define(version: 2023_08_29_012939) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "executors", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "is_admin", default: false, null: false
  end

  create_table "platformings", force: :cascade do |t|
    t.bigint "platform_id", null: false
    t.string "platformable_type", null: false
    t.bigint "platformable_id", null: false
    t.bigint "external_user_id", null: false
    t.index ["platform_id", "external_user_id"], name: "index_platformings_on_platform_id_and_external_user_id"
    t.index ["platform_id"], name: "index_platformings_on_platform_id"
    t.index ["platformable_type", "platformable_id"], name: "index_platformings_on_platformable"
  end

  create_table "platforms", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.text "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
