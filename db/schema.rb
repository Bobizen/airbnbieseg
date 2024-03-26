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

ActiveRecord::Schema[7.0].define(version: 2024_03_26_131333) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "flat_id"
    t.decimal "price_per_night", precision: 10, scale: 2
    t.decimal "price_in_total", precision: 10, scale: 2
    t.date "checkin_date"
    t.date "checkout_date"
    t.integer "guests"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_bookings_on_flat_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "flat_amenities", force: :cascade do |t|
    t.bigint "flat_id", null: false
    t.bigint "amenitie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amenitie_id"], name: "index_flat_amenities_on_amenitie_id"
    t.index ["flat_id"], name: "index_flat_amenities_on_flat_id"
  end

  create_table "flatavailabledates", force: :cascade do |t|
    t.bigint "flat_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_flatavailabledates_on_flat_id"
  end

  create_table "flats", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "country"
    t.string "city"
    t.string "region"
    t.string "zipcode"
    t.text "description"
    t.decimal "price_per_night"
    t.boolean "free_cancellation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_flats_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "flat_id", null: false
    t.bigint "user_id", null: false
    t.string "title"
    t.text "comment"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_reviews_on_flat_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "legal_name"
    t.string "government_id"
    t.string "phone_number"
    t.string "address"
    t.string "emergency_contact_number"
    t.text "description"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "flats"
  add_foreign_key "bookings", "users"
  add_foreign_key "flat_amenities", "amenities", column: "amenitie_id"
  add_foreign_key "flat_amenities", "flats"
  add_foreign_key "flatavailabledates", "flats"
  add_foreign_key "flats", "users"
  add_foreign_key "reviews", "flats"
  add_foreign_key "reviews", "users"
end
