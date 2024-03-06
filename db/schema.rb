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

ActiveRecord::Schema[7.1].define(version: 2024_03_06_200657) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.datetime "datetime"
    t.bigint "vet_id", null: false
    t.bigint "pet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_appointments_on_pet_id"
    t.index ["vet_id"], name: "index_appointments_on_vet_id"
  end

  create_table "clinics", force: :cascade do |t|
    t.string "cnpj"
    t.string "address"
    t.string "company_name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clinics_on_user_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "breed"
    t.date "birth"
    t.bigint "tutor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tutor_id"], name: "index_pets_on_tutor_id"
  end

  create_table "records", force: :cascade do |t|
    t.string "content"
    t.string "exams"
    t.bigint "appointment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_records_on_appointment_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.float "vet_rating"
    t.float "clinic_rating"
    t.text "content"
    t.bigint "appointment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_reviews_on_appointment_id"
  end

  create_table "tutors", force: :cascade do |t|
    t.string "fullname"
    t.string "address"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tutors_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vets", force: :cascade do |t|
    t.string "fullname"
    t.string "crmv"
    t.string "specialty"
    t.bigint "user_id", null: false
    t.bigint "clinic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_vets_on_clinic_id"
    t.index ["user_id"], name: "index_vets_on_user_id"
  end

  add_foreign_key "appointments", "pets"
  add_foreign_key "appointments", "vets"
  add_foreign_key "clinics", "users"
  add_foreign_key "pets", "tutors"
  add_foreign_key "records", "appointments"
  add_foreign_key "reviews", "appointments"
  add_foreign_key "tutors", "users"
  add_foreign_key "vets", "clinics"
  add_foreign_key "vets", "users"
end
