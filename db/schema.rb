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

ActiveRecord::Schema.define(version: 20200423104852) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id_id",         null: false
    t.string   "family_name",        null: false
    t.string   "first_name",         null: false
    t.string   "family_name_kana",   null: false
    t.string   "first_name_kana",    null: false
    t.string   "postal_code",        null: false
    t.string   "prefectures",        null: false
    t.string   "municipalities",     null: false
    t.string   "house_number",       null: false
    t.string   "building_name",      null: false
    t.string   "house_phone_number", null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["user_id_id"], name: "index_addresses_on_user_id_id", using: :btree
  end

  create_table "cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",          null: false
    t.integer  "card_number",      null: false
    t.integer  "expiration_month", null: false
    t.integer  "expiration_year",  null: false
    t.integer  "securitycord",     null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "password",                                          null: false
    t.string   "nickname",                                          null: false
    t.string   "family_name",                                       null: false
    t.string   "first_name",                                        null: false
    t.string   "family_name_kana",                                  null: false
    t.string   "first_name_kana",                                   null: false
    t.string   "phone_number",                                      null: false
    t.integer  "birth_year",                                        null: false
    t.integer  "birth_month",                                       null: false
    t.integer  "birth_date",                                        null: false
    t.text     "profile",                limit: 65535
    t.text     "icon",                   limit: 65535
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

ActiveRecord::Schema.define(version: 20200311090008) do

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "src",        null: false
    t.integer  "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_images_on_product_id", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                limit: 40
    t.integer  "price"
    t.text     "product_explanation", limit: 65535,             null: false
    t.integer  "trade_status",                      default: 0
    t.integer  "category"
    t.text     "brand",               limit: 65535
    t.string   "product_situation"
    t.integer  "shipping_charges"
    t.integer  "shipping_origin"
    t.integer  "arrival_days"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.index ["name"], name: "index_products_on_name", using: :btree
    t.index ["price"], name: "index_products_on_price", using: :btree
  end

  add_foreign_key "images", "products"
end
