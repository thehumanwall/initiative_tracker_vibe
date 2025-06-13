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

ActiveRecord::Schema[8.0].define(version: 2025_06_13_192329) do
  create_table "action_items", force: :cascade do |t|
    t.string "name"
    t.integer "metric_id", null: false
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["metric_id"], name: "index_action_items_on_metric_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "value"
    t.integer "score_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["score_id"], name: "index_comments_on_score_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "metrics", force: :cascade do |t|
    t.string "name"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scales", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scores", force: :cascade do |t|
    t.integer "scale_id", null: false
    t.integer "team_id", null: false
    t.integer "action_item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_item_id"], name: "index_scores_on_action_item_id"
    t.index ["scale_id"], name: "index_scores_on_scale_id"
    t.index ["team_id"], name: "index_scores_on_team_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "action_items", "metrics"
  add_foreign_key "comments", "scores"
  add_foreign_key "comments", "users"
  add_foreign_key "scores", "action_items"
  add_foreign_key "scores", "scales"
  add_foreign_key "scores", "teams"
  add_foreign_key "sessions", "users"
end
