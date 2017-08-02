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

ActiveRecord::Schema.define(version: 0) do

  create_table "bank_accounts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "bankaccount_id"
    t.string "bankaccount_number"
    t.integer "balance"
    t.index ["bankaccount_id"], name: "index_bank_accounts_on_bankaccount_id"
    t.index ["user_id"], name: "index_bank_accounts_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "bankaccount_id1"
    t.integer "bankaccount_id2"
    t.integer "transfer"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.integer "user_id"
    t.text "name"
    t.text "email"
    t.datetime "create_at"
    t.datetime "updated_at"
    t.text "password_digest"
    t.index ["user_id"], name: "index_users_on_user_id"
  end

end