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

ActiveRecord::Schema.define(version: 2020_02_06_080430) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comment_demands", force: :cascade do |t|
    t.bigint "demand_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["demand_id"], name: "index_comment_demands_on_demand_id"
    t.index ["user_id"], name: "index_comment_demands_on_user_id"
  end

  create_table "comment_supplies", force: :cascade do |t|
    t.bigint "supply_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["supply_id"], name: "index_comment_supplies_on_supply_id"
    t.index ["user_id"], name: "index_comment_supplies_on_user_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_conversations_on_recipient_id"
    t.index ["sender_id", "recipient_id"], name: "index_conversations_on_sender_id_and_recipient_id", unique: true
    t.index ["sender_id"], name: "index_conversations_on_sender_id"
  end

  create_table "demands", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "picture"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_demands_on_user_id"
  end

  create_table "favorite_demands", force: :cascade do |t|
    t.integer "user_id"
    t.integer "demand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorite_supplies", force: :cascade do |t|
    t.integer "user_id"
    t.integer "supply_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labelling_demands", force: :cascade do |t|
    t.bigint "demand_id"
    t.bigint "label_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["demand_id"], name: "index_labelling_demands_on_demand_id"
    t.index ["label_id"], name: "index_labelling_demands_on_label_id"
  end

  create_table "labelling_supplies", force: :cascade do |t|
    t.bigint "label_id"
    t.bigint "supply_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["label_id"], name: "index_labelling_supplies_on_label_id"
    t.index ["supply_id"], name: "index_labelling_supplies_on_supply_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "category"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "conversation_id"
    t.bigint "user_id"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "supplies", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "picture"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_supplies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "admin", default: false
    t.string "name"
    t.string "picture"
    t.text "introduction"
    t.integer "region"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comment_demands", "demands"
  add_foreign_key "comment_demands", "users"
  add_foreign_key "comment_supplies", "supplies"
  add_foreign_key "comment_supplies", "users"
  add_foreign_key "demands", "users"
  add_foreign_key "labelling_demands", "demands"
  add_foreign_key "labelling_demands", "labels"
  add_foreign_key "labelling_supplies", "labels"
  add_foreign_key "labelling_supplies", "supplies"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "supplies", "users"
end
