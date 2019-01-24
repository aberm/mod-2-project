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

ActiveRecord::Schema.define(version: 2019_01_24_143955) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bosses", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "username"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "taskers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "username"
    t.string "city"
    t.text "bio"
    t.boolean "vehicle", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "city"
    t.text "description"
    t.string "category"
    t.integer "boss_id"
    t.integer "tasker_id"
    t.boolean "vehicle", default: false
    t.integer "rating"
    t.text "review"
    t.integer "minutes"
    t.integer "price_rate"
    t.boolean "completed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "boss_rating"
    t.datetime "time"
  end

end
