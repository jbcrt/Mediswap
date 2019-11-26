# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_23_233322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "offers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.string "title"
    t.string "contract_type"
    t.date "starts_at"
    t.date "ends_at"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.text "description"
    t.string "retrocession"
    t.boolean "vehicle"
    t.boolean "housing"
    t.boolean "secretariat"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.boolean "admin", default: false, null: false
    t.string "title"
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.string "birth_place"
    t.string "personnal_phone_number"
    t.string "personnal_address"
    t.string "personnal_additional_address"
    t.string "personnal_postal_code_address"
    t.string "personnal_city_address"
    t.string "profession"
    t.string "status"
    t.string "structure_name"
    t.string "rpps_number"
    t.string "adeli_number"
    t.string "urssaf_number"
    t.string "council_number"
    t.string "council_location"
    t.string "council_email"
    t.string "professionnal_phone_number"
    t.string "professionnal_address"
    t.string "professionnal_additional_address"
    t.string "professionnal_postal_code_address"
    t.string "professionnal_city_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "offers", "users"
end
