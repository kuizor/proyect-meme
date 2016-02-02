# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160202040354) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "email_details", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "email_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "email_details", ["email_id"], name: "index_email_details_on_email_id", using: :btree
  add_index "email_details", ["user_id"], name: "index_email_details_on_user_id", using: :btree

  create_table "emails", force: :cascade do |t|
    t.string   "email_name", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "memes", force: :cascade do |t|
    t.string   "id_img",      limit: 255
    t.string   "text_top",    limit: 255
    t.string   "text_buttom", limit: 255
    t.string   "link",        limit: 255
    t.string   "type_meme",   limit: 255
    t.integer  "vote",        limit: 4
    t.integer  "category_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "memes", ["category_id"], name: "index_memes_on_category_id", using: :btree

  create_table "tag_details", force: :cascade do |t|
    t.integer  "meme_id",    limit: 4
    t.integer  "tag_id",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "tag_details", ["meme_id"], name: "index_tag_details_on_meme_id", using: :btree
  add_index "tag_details", ["tag_id"], name: "index_tag_details_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "user_details", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "meme_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "user_details", ["meme_id"], name: "index_user_details_on_meme_id", using: :btree
  add_index "user_details", ["user_id"], name: "index_user_details_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "login",      limit: 255
    t.string   "password",   limit: 255
    t.string   "token",      limit: 255
    t.string   "type_user",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "email_details", "emails"
  add_foreign_key "email_details", "users"
  add_foreign_key "memes", "categories"
  add_foreign_key "tag_details", "memes"
  add_foreign_key "tag_details", "tags"
  add_foreign_key "user_details", "memes"
  add_foreign_key "user_details", "users"
end
