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

ActiveRecord::Schema.define(version: 2018_11_12_184339) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "stadium_id"
    t.integer "game_id"
    t.date "booking_date"
    t.string "time_slot"
    t.string "is_paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "stadium_id"], name: "index_bookings_on_user_id_and_stadium_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games_users", id: false, force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "user_id", null: false
    t.index ["game_id", "user_id"], name: "index_games_users_on_game_id_and_user_id"
  end

  create_table "interests", force: :cascade do |t|
    t.integer "game_id"
    t.integer "user_id"
    t.date "date_join"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stadia", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "contact_number"
    t.string "game"
    t.string "price_for_hour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.string "open_time"
    t.string "close_time"
  end

  create_table "timeslots", force: :cascade do |t|
    t.string "time_slot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "address"
    t.string "phone_number"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
