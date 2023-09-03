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

ActiveRecord::Schema[7.0].define(version: 2023_08_27_235441) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "duel_participants", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "duel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["duel_id"], name: "index_duel_participants_on_duel_id"
    t.index ["user_id", "duel_id"], name: "index_duel_participants_on_user_id_and_duel_id", unique: true
    t.index ["user_id"], name: "index_duel_participants_on_user_id"
  end

  create_table "duel_problems", force: :cascade do |t|
    t.bigint "duel_id", null: false
    t.bigint "problem_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["duel_id"], name: "index_duel_problems_on_duel_id"
    t.index ["problem_id"], name: "index_duel_problems_on_problem_id"
  end

  create_table "duels", force: :cascade do |t|
    t.integer "state", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "winner_id"
    t.integer "winner_points"
    t.string "complexity"
    t.string "type", default: "Duel"
    t.boolean "private", default: true
    t.string "invitation_code"
    t.integer "leader_id"
    t.bigint "problem_set_id"
    t.index ["problem_set_id"], name: "index_duels_on_problem_set_id"
    t.index ["winner_id"], name: "index_duels_on_winner_id"
  end

  create_table "problem_sets", force: :cascade do |t|
    t.string "name"
    t.integer "complexity"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["complexity"], name: "index_problem_sets_on_complexity"
    t.index ["user_id"], name: "index_problem_sets_on_user_id"
  end

  create_table "problems", force: :cascade do |t|
    t.string "description"
    t.integer "points"
    t.string "choices", default: [], array: true
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "problem_set_id", null: false
    t.index ["problem_set_id"], name: "index_problems_on_problem_set_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "duel_id", null: false
    t.bigint "problem_id", null: false
    t.string "choice"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["duel_id"], name: "index_submissions_on_duel_id"
    t.index ["problem_id"], name: "index_submissions_on_problem_id"
    t.index ["user_id"], name: "index_submissions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "level"
    t.integer "status", default: 0
    t.integer "points", default: 0
    t.boolean "online", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["level"], name: "index_users_on_level"
    t.index ["points"], name: "index_users_on_points", order: :desc
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["status"], name: "index_users_on_status"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "duel_participants", "duels"
  add_foreign_key "duel_participants", "users"
  add_foreign_key "duel_problems", "duels"
  add_foreign_key "duel_problems", "problems"
  add_foreign_key "duels", "problem_sets"
  add_foreign_key "problem_sets", "users"
  add_foreign_key "problems", "problem_sets"
  add_foreign_key "submissions", "duels"
  add_foreign_key "submissions", "problems"
  add_foreign_key "submissions", "users"
end
