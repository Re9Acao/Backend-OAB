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

ActiveRecord::Schema[7.1].define(version: 2025_05_29_063505) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evaluation_law_areas", force: :cascade do |t|
    t.bigint "evaluation_id", null: false
    t.bigint "law_area_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluation_id"], name: "index_evaluation_law_areas_on_evaluation_id"
    t.index ["law_area_id"], name: "index_evaluation_law_areas_on_law_area_id"
  end

  create_table "evaluation_questions", force: :cascade do |t|
    t.bigint "evaluation_id", null: false
    t.bigint "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluation_id"], name: "index_evaluation_questions_on_evaluation_id"
    t.index ["question_id"], name: "index_evaluation_questions_on_question_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.datetime "expires_at"
    t.boolean "finished", default: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "correct_score"
    t.index ["user_id"], name: "index_evaluations_on_user_id"
  end

  create_table "law_areas", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.string "evaluation_board"
    t.string "year"
    t.string "option_1"
    t.string "option_2"
    t.string "option_3"
    t.string "option_4"
    t.string "option_5"
    t.integer "correct_answer"
    t.boolean "available", default: true
    t.bigint "law_area_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "question_type", default: 1, null: false
    t.index ["law_area_id"], name: "index_questions_on_law_area_id"
  end

  create_table "standard_answers", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.text "text"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_standard_answers_on_question_id"
  end

  create_table "user_answers", force: :cascade do |t|
    t.bigint "evaluation_question_id", null: false
    t.bigint "user_id", null: false
    t.integer "question_type", null: false
    t.string "selected_option"
    t.text "written_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluation_question_id"], name: "index_user_answers_on_evaluation_question_id"
    t.index ["user_id"], name: "index_user_answers_on_user_id"
  end

  create_table "user_performances", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "law_area_id", null: false
    t.bigint "evaluation_id", null: false
    t.integer "question_type", null: false
    t.integer "correct_count", default: 0, null: false
    t.integer "incorrect_count", default: 0, null: false
    t.integer "total_questions", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluation_id"], name: "index_user_performances_on_evaluation_id"
    t.index ["law_area_id"], name: "index_user_performances_on_law_area_id"
    t.index ["user_id"], name: "index_user_performances_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.boolean "allow_password_change", default: false
    t.json "tokens"
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "evaluation_law_areas", "evaluations"
  add_foreign_key "evaluation_law_areas", "law_areas"
  add_foreign_key "evaluation_questions", "evaluations"
  add_foreign_key "evaluation_questions", "questions"
  add_foreign_key "evaluations", "users"
  add_foreign_key "questions", "law_areas"
  add_foreign_key "standard_answers", "questions"
  add_foreign_key "user_answers", "evaluation_questions"
  add_foreign_key "user_answers", "users"
  add_foreign_key "user_performances", "evaluations"
  add_foreign_key "user_performances", "law_areas"
  add_foreign_key "user_performances", "users"
end
