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
ActiveRecord::Schema.define(version: 20180301134432) do
=======
ActiveRecord::Schema.define(version: 20180312030621) do
>>>>>>> airwaze-mvp/master

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
  create_table "order_transactions", force: :cascade do |t|
    t.bigint "issuer_wallet_id"
    t.bigint "receiver_wallet_id"
    t.decimal "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
=======
  create_table "currencies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "kind", default: 0, null: false
  end

  create_table "order_transactions", force: :cascade do |t|
    t.bigint "issuer_wallet_id"
    t.bigint "receiver_wallet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "currency_id"
    t.integer "amount"
    t.index ["currency_id"], name: "index_order_transactions_on_currency_id"
>>>>>>> airwaze-mvp/master
    t.index ["issuer_wallet_id"], name: "index_order_transactions_on_issuer_wallet_id"
    t.index ["receiver_wallet_id"], name: "index_order_transactions_on_receiver_wallet_id"
  end

<<<<<<< HEAD
  create_table "wallets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "kind", default: 0, null: false
    t.integer "juvo_token_balance", default: 0
    t.integer "air_time_token_balance", default: 0
  end

  add_foreign_key "order_transactions", "wallets", column: "issuer_wallet_id"
  add_foreign_key "order_transactions", "wallets", column: "receiver_wallet_id"
=======
  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "image_url"
    t.integer "kind", default: 0, null: false
    t.string "qr_code"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wallets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "currency_id"
    t.integer "balance"
    t.index ["currency_id"], name: "index_wallets_on_currency_id"
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  add_foreign_key "order_transactions", "currencies"
  add_foreign_key "order_transactions", "wallets", column: "issuer_wallet_id"
  add_foreign_key "order_transactions", "wallets", column: "receiver_wallet_id"
  add_foreign_key "wallets", "currencies"
  add_foreign_key "wallets", "users"
>>>>>>> airwaze-mvp/master
end
