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

ActiveRecord::Schema.define(version: 20140403205239) do

  create_table "experiences", force: :cascade do |t|
    t.date     "from"
    t.date     "to"
    t.string   "role",         limit: 255
    t.string   "company",      limit: 255
    t.string   "company_link", limit: 255
    t.text     "desc",         limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",      limit: 4
    t.text     "duty",         limit: 65535
    t.integer  "created_by",   limit: 4
  end

  create_table "frameworks", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "desc",       limit: 65535
    t.integer  "created_by", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "link",       limit: 65535
    t.integer  "user_id",    limit: 4
  end

  create_table "frameworks_users", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "framework_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "highlights", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "link",       limit: 65535
    t.text     "desc",       limit: 65535
    t.integer  "created_by", limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "desc",       limit: 65535
    t.integer  "created_by", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "link",       limit: 65535
    t.integer  "user_id",    limit: 4
  end

  create_table "languages_users", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "language_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skill_topics", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "desc",       limit: 65535
    t.integer  "created_by", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skill_topics_users", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "skill_topic_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.text     "desc",           limit: 65535
    t.integer  "created_by",     limit: 4
    t.integer  "updated_by",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "skill_topic_id", limit: 4
    t.text     "link",           limit: 65535
    t.integer  "user_id",        limit: 4
  end

  create_table "skills_users", force: :cascade do |t|
    t.integer  "skill_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",       limit: 255
    t.string   "middle_name",      limit: 255
    t.string   "last_name",        limit: 255
    t.text     "summary",          limit: 65535
    t.string   "email",            limit: 255
    t.string   "mobile",           limit: 255
    t.text     "address",          limit: 65535
    t.string   "github_text",      limit: 255
    t.text     "github_link",      limit: 65535
    t.string   "twitter_text",     limit: 255
    t.text     "twitter_link",     limit: 65535
    t.string   "fb_link",          limit: 255
    t.text     "fb_text",          limit: 65535
    t.string   "so_text",          limit: 255
    t.text     "so_link",          limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider",         limit: 255
    t.string   "uid",              limit: 255
    t.string   "oauth_token",      limit: 255
    t.datetime "oauth_expires_at"
    t.string   "provider_name",    limit: 255
  end

end
