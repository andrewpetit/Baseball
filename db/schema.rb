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

ActiveRecord::Schema.define(version: 20180418151155) do

  create_table "fantasy_baseball_roster_members", force: :cascade do |t|
    t.integer "fantasy_baseball_roster_id"
    t.string "headshot_url"
    t.string "image_url"
    t.string "first_name"
    t.string "last_name"
    t.string "external_id"
    t.string "eligible_positions"
    t.string "selected_position"
    t.string "display_position"
    t.string "uniform_number"
    t.string "position_type"
    t.boolean "is_undroppable"
    t.string "editorial_player_key"
    t.string "editorial_team_key"
    t.string "editorial_team_full_name"
    t.string "editorial_team_abbr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "updated_position"
    t.index ["fantasy_baseball_roster_id"], name: "index_fantasy_roster_members_on_fantasy_roster_id"
  end

  create_table "fantasy_baseball_rosters", force: :cascade do |t|
    t.integer "fantasy_baseball_team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "roster_sort_id"
    t.integer "update_type_id"
    t.index ["fantasy_baseball_team_id"], name: "index_fantasy_baseball_rosters_on_fantasy_baseball_team_id"
  end

  create_table "fantasy_baseball_teams", force: :cascade do |t|
    t.integer "user_id"
    t.string "league_key"
    t.string "league_id"
    t.string "team_id"
    t.string "team_name"
    t.string "league_name"
    t.boolean "is_active"
    t.boolean "auto_update"
    t.string "team_icon_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "roster_sort_id"
    t.index ["user_id"], name: "index_fantasy_baseball_teams_on_user_id"
  end

  create_table "roster_sorts", force: :cascade do |t|
    t.string "sort_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
  end

  create_table "update_types", force: :cascade do |t|
    t.string "update_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "yahoo_access_tokens", force: :cascade do |t|
    t.integer "user_id"
    t.string "access_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_yahoo_access_tokens_on_user_id"
  end

end
