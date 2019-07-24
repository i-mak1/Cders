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

ActiveRecord::Schema.define(version: 2019_07_24_100446) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.string "first_name_kana"
    t.string "last_name_kana"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "artists", force: :cascade do |t|
    t.text "artist_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "enduser_id"
    t.integer "item_id"
    t.integer "quantity"
  end

  create_table "contacts", force: :cascade do |t|
    t.text "contact"
    t.text "reply"
    t.boolean "is_deleted"
    t.integer "enduser_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "disks", force: :cascade do |t|
    t.text "disk_name"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "endusers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.string "first_name_kana"
    t.string "last_name_kana"
    t.string "postcode"
    t.text "address"
    t.string "tel"
    t.boolean "is_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_endusers_on_deleted_at"
    t.index ["email"], name: "index_endusers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_endusers_on_reset_password_token", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.text "genre_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "price"
    t.text "item_name"
    t.text "item_image_id"
    t.integer "stock_number"
    t.integer "item_status"
    t.boolean "is_deleted"
    t.integer "artist_id"
    t.integer "genre_id"
    t.integer "label_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_items_on_deleted_at"
  end

  create_table "labels", force: :cascade do |t|
    t.text "label_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "purchase_number"
    t.integer "purchase_price"
    t.boolean "is_deleted"
    t.integer "item_id"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_order_details_on_deleted_at"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "payment"
    t.integer "order_status"
    t.integer "shipping_fee"
    t.boolean "is_deleted"
    t.integer "enduser_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "shipping_id"
    t.boolean "confirm", default: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_orders_on_deleted_at"
  end

  create_table "shippings", force: :cascade do |t|
    t.string "shipping_first_name"
    t.string "shipping_last_name"
    t.string "shipping_first_name_kana"
    t.string "shipping_last_name_kana"
    t.string "shipping_postcode"
    t.text "shipping_address"
    t.boolean "is_delete"
    t.integer "enduser_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_shippings_on_deleted_at"
  end

  create_table "songs", force: :cascade do |t|
    t.text "song_name"
    t.integer "track"
    t.integer "disk_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
