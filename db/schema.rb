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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20180416204552) do
=======
ActiveRecord::Schema.define(version: 20180418092907) do
>>>>>>> client-ctrlr

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "email", null: false
    t.string "token", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["token"], name: "index_clients_on_token", unique: true
  end

  create_table "examples", force: :cascade do |t|
    t.text "text", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_examples_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.money "price", scale: 2
    t.text "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["id"], name: "index_items_on_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.text "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "item_id"
    t.index ["item_id"], name: "index_orders_on_item_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "token", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "isadmin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  add_foreign_key "examples", "users"
  add_foreign_key "items", "users"
  add_foreign_key "orders", "items"
  add_foreign_key "orders", "users"
end
