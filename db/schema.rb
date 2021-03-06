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

ActiveRecord::Schema.define(version: 2018_09_04_220454) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "exam_id"
  end

  create_table "lab_tests", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "normal_high_end", precision: 7, scale: 2
    t.decimal "normal_low_end", precision: 7, scale: 2
    t.integer "lab_test_id"
  end

  create_table "medications", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", force: :cascade do |t|
    t.integer "user_id"
    t.string "test_name"
    t.decimal "result"
    t.datetime "date_completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "result_history", default: [], array: true
    t.datetime "date_history", default: [], array: true
  end

  create_table "shots", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "shot_id"
  end

  create_table "user_exams", force: :cascade do |t|
    t.integer "user_id"
    t.integer "exam_id"
    t.datetime "date_completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date_history", default: [], array: true
  end

  create_table "user_lab_tests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "lab_test_id"
    t.datetime "date_completed"
    t.decimal "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "result_history", default: [], array: true
    t.datetime "date_history", default: [], array: true
  end

  create_table "user_medications", force: :cascade do |t|
    t.integer "user_id"
    t.integer "medication_id"
    t.string "name"
    t.decimal "dose"
    t.string "route"
    t.string "frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_shots", force: :cascade do |t|
    t.integer "user_id"
    t.integer "shot_id"
    t.datetime "date_completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date_history", default: [], array: true
  end

  create_table "user_vitals", force: :cascade do |t|
    t.integer "user_id"
    t.integer "vital_id"
    t.string "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date_completed"
    t.text "result_history", default: [], array: true
    t.datetime "date_history", default: [], array: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vitals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "vital_id"
  end

end
