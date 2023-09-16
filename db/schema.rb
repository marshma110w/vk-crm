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

ActiveRecord::Schema[7.0].define(version: 2023_09_03_091441) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chats", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_chats_on_order_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "platform_id", null: false
    t.bigint "external_id", null: false
    t.index ["platform_id", "external_id"], name: "index_clients_on_platform_id_and_external_id", unique: true
    t.index ["platform_id"], name: "index_clients_on_platform_id"
  end

  create_table "executors", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "is_admin", default: false, null: false
    t.bigint "platform_id", null: false
    t.bigint "external_id", null: false
    t.index ["platform_id", "external_id"], name: "index_executors_on_platform_id_and_external_id", unique: true
    t.index ["platform_id"], name: "index_executors_on_platform_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "chat_id", null: false
    t.string "user_type", null: false
    t.bigint "user_id", null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["user_type", "user_id"], name: "index_messages_on_user"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "executor_id"
    t.bigint "subject_id"
    t.bigint "platform_id"
    t.string "title"
    t.text "description"
    t.decimal "price"
    t.datetime "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["executor_id"], name: "index_orders_on_executor_id"
    t.index ["platform_id"], name: "index_orders_on_platform_id"
    t.index ["subject_id"], name: "index_orders_on_subject_id"
  end

  create_table "platforms", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "clients", "platforms"
  add_foreign_key "executors", "platforms"
end
