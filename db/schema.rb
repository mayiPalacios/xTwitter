# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_21_164244) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "tweet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tweet_id"], name: "index_bookmarks_on_tweet_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "followers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "following_id"
    t.integer "followee_id"
  end

  create_table "hashtags", force: :cascade do |t|
    t.string "hashtag_name"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "tweets_id"
  end

  create_table "replies", force: :cascade do |t|
    t.text "reply_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "tweet_id"
  end

  create_table "tags", force: :cascade do |t|
    t.bigint "tweet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hashtag_id"
    t.index ["tweet_id"], name: "index_tags_on_tweet_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.text "body"
    t.boolean "quote"
    t.boolean "retweet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "like_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "follower_number"
    t.integer "following_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "password"
    t.string "username"
    t.string "lastname"
  end

  add_foreign_key "bookmarks", "tweets"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "followers", "users", column: "followee_id"
  add_foreign_key "followers", "users", column: "following_id"
  add_foreign_key "likes", "tweets", column: "tweets_id"
  add_foreign_key "likes", "users"
  add_foreign_key "replies", "tweets"
  add_foreign_key "replies", "users"
  add_foreign_key "tags", "hashtags"
  add_foreign_key "tags", "tweets"
  add_foreign_key "tweets", "likes"
  add_foreign_key "tweets", "users"
end
