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

ActiveRecord::Schema.define(version: 2019_03_27_155216) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "battles", force: :cascade do |t|
    t.integer "player_1_id"
    t.integer "player_2_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "winner_id"
    t.integer "loser_id"
    t.float "winner_score"
    t.float "loser_score"
    t.boolean "draw", default: false
    t.float "score1"
    t.float "score2"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "life_points", default: 5, null: false
    t.float "attack_points", default: 1.0, null: false
    t.integer "strength_points", default: 6, null: false
    t.integer "intelligence_points", default: 4, null: false
    t.integer "magic_points", default: 5, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
  end

end
