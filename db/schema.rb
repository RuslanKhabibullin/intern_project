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

ActiveRecord::Schema.define(version: 20161210100529) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title",                   null: false
    t.text     "content",                 null: false
    t.integer  "author_id",               null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "likes_count", default: 0
    t.index ["author_id"], name: "index_articles_on_author_id", using: :btree
    t.index ["title"], name: "index_articles_on_title", unique: true, using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "article_id", null: false
    t.integer  "user_id",    null: false
    t.string   "text",       null: false
    t.datetime "created_at", null: false
    t.index ["article_id"], name: "index_comments_on_article_id", using: :btree
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id",    null: false
    t.integer "article_id", null: false
    t.index ["user_id", "article_id"], name: "index_likes_on_user_id_and_article_id", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",                            null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "locale",                 default: 0
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
