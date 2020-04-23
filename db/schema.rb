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

ActiveRecord::Schema.define(version: 2020_02_24_190824) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "active_storage_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.uuid "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "facilities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.boolean "completed", default: false
    t.string "name"
    t.string "category"
    t.string "finess_number"
    t.text "description"
    t.string "street"
    t.string "additional_address"
    t.string "department"
    t.string "zipcode"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.boolean "same_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_facilities_on_user_id"
  end

  create_table "offers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.string "type"
    t.string "title"
    t.string "contract_type"
    t.string "profession"
    t.text "description"
    t.string "working_time"
    t.date "starts_at"
    t.date "ends_at"
    t.boolean "has_salary_set"
    t.string "salary"
    t.string "salary_period"
    t.string "retrocession"
    t.string "candidate_job_experience"
    t.text "candidate_description"
    t.string "daily_medical_acts_number"
    t.boolean "on_call"
    t.boolean "vehicle_required"
    t.string "visit"
    t.string "sector"
    t.string "secretariat"
    t.string "software_used"
    t.boolean "housing_possibility"
    t.string "selling_price"
    t.string "premises_size"
    t.string "premises_rooms_number"
    t.string "premises_price"
    t.string "premises_rent"
    t.boolean "premises_furnished"
    t.boolean "premises_has_parking"
    t.boolean "accessible_premises"
    t.string "street"
    t.string "additional_address"
    t.string "department"
    t.string "zipcode"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.string "offer_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["type", "user_id"], name: "index_offers_on_type_and_user_id"
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
    t.string "avatar_id"
    t.string "user_type"
    t.boolean "candidate"
    t.string "title"
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.string "phone_number"
    t.string "profession"
    t.string "professional_id_number"
    t.string "mssante_email"
    t.string "council_id_number"
    t.string "council_department"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "facilities", "users"
  add_foreign_key "offers", "users"
end
