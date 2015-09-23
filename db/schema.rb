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

ActiveRecord::Schema.define(version: 20150916213052) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.integer  "section_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "board_topics", force: :cascade do |t|
    t.integer  "discussion_board_id"
    t.string   "name"
    t.integer  "rank"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "discussion_boards", force: :cascade do |t|
    t.integer  "section_id"
    t.boolean  "available_to_students"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "instructors", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_initial"
    t.string   "contact_no"
    t.datetime "locked_at"
    t.string   "unlock_token"
    t.integer  "failed_attempts"
  end

  add_index "instructors", ["email"], name: "index_instructors_on_email", unique: true, using: :btree
  add_index "instructors", ["reset_password_token"], name: "index_instructors_on_reset_password_token", unique: true, using: :btree
  add_index "instructors", ["unlock_token"], name: "index_instructors_on_unlock_token", unique: true, using: :btree

  create_table "parents", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "contact_no"
    t.string   "street_address_1"
    t.string   "street_address_2"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "student_id"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "parents", ["email"], name: "index_parents_on_email", unique: true, using: :btree
  add_index "parents", ["reset_password_token"], name: "index_parents_on_reset_password_token", unique: true, using: :btree

  create_table "payments", force: :cascade do |t|
    t.date     "payment_date"
    t.integer  "subscription_id"
    t.integer  "amount_cents"
    t.string   "status"
    t.string   "transaction_id"
    t.string   "type"
    t.integer  "student_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "payments", ["status"], name: "index_payments_on_status", using: :btree

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.integer  "subject_id"
    t.string   "codename"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "open"
    t.integer  "instructor_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "student_sections", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "section_id"
    t.boolean  "withdrawn",  default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "subject_id"
  end

  create_table "students", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "middle_initial"
    t.string   "last_name"
    t.date     "dob"
    t.string   "gender"
    t.integer  "school_id"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts"
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "students", ["confirmation_token"], name: "index_students_on_confirmation_token", unique: true, using: :btree
  add_index "students", ["email"], name: "index_students_on_email", unique: true, using: :btree
  add_index "students", ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true, using: :btree
  add_index "students", ["unlock_token"], name: "index_students_on_unlock_token", unique: true, using: :btree

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.boolean  "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "student_id"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "thread_posts", force: :cascade do |t|
    t.integer  "topic_thread_id"
    t.text     "content"
    t.integer  "student_id"
    t.integer  "instructor_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "topic_threads", force: :cascade do |t|
    t.integer  "board_topic_id"
    t.string   "title"
    t.integer  "student_id"
    t.integer  "instructor_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "wiz_iq_classes", force: :cascade do |t|
    t.integer  "wiziqclass_id"
    t.integer  "instructor_id"
    t.string   "instructor_url"
    t.string   "administrator_url"
    t.string   "name"
    t.datetime "start_time"
    t.integer  "duration"
    t.boolean  "recording_requested"
    t.string   "recording_url"
    t.integer  "section_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "type"
    t.integer  "status",              default: 0
  end

  add_index "wiz_iq_classes", ["instructor_id"], name: "index_wiz_iq_classes_on_instructor_id", using: :btree
  add_index "wiz_iq_classes", ["section_id"], name: "index_wiz_iq_classes_on_section_id", using: :btree
  add_index "wiz_iq_classes", ["wiziqclass_id"], name: "index_wiz_iq_classes_on_wiziqclass_id", unique: true, using: :btree

end
