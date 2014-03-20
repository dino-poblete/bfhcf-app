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

ActiveRecord::Schema.define(version: 20140320080821) do

  create_table "devotionals", force: true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "content",    limit: 255
    t.date     "posted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "devotionals", ["user_id", "created_at"], name: "index_devotionals_on_user_id_and_created_at"

  create_table "events", force: true do |t|
    t.string   "title"
    t.string   "ministry"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "picture"
    t.text     "content",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", force: true do |t|
    t.string   "title"
    t.text     "content",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.integer  "gallery_id"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ministries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ministries", ["name"], name: "index_ministries_on_name"

  create_table "posts", force: true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["user_id", "created_at"], name: "index_posts_on_user_id_and_created_at"

  create_table "sermons", force: true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "content",    limit: 255
    t.date     "posted_at"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sermons", ["user_id", "created_at"], name: "index_sermons_on_user_id_and_created_at"

  create_table "users", force: true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
