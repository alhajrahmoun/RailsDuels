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

ActiveRecord::Schema[7.0].define(version: 2023_07_30_145413) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "duel_problems", force: :cascade do |t|
    t.bigint "duel_id", null: false
    t.bigint "problem_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["duel_id"], name: "index_duel_problems_on_duel_id"
    t.index ["problem_id"], name: "index_duel_problems_on_problem_id"
  end

  create_table "duels", force: :cascade do |t|
    t.integer "state"
    t.bigint "user_1_id", null: false
    t.bigint "user_2_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "winner_id"
    t.integer "winner_points"
    t.index ["user_1_id"], name: "index_duels_on_user_1_id"
    t.index ["user_2_id"], name: "index_duels_on_user_2_id"
    t.index ["winner_id"], name: "index_duels_on_winner_id"
  end

  create_table "problems", force: :cascade do |t|
    t.string "description"
    t.integer "points"
    t.integer "complexity"
    t.string "choices", default: [], array: true
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
  end

  add_foreign_key "duel_problems", "duels"
  add_foreign_key "duel_problems", "problems"
  add_foreign_key "duels", "users", column: "user_1_id"
  add_foreign_key "duels", "users", column: "user_2_id"
  add_foreign_key "submissions", "duels"
  add_foreign_key "submissions", "problems"
  add_foreign_key "submissions", "users"
end
