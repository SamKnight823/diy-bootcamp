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

ActiveRecord::Schema.define(version: 20170618174844) do

  create_table "drills", force: :cascade do |t|
    t.integer "cardio"
    t.integer "pushups"
    t.integer "squats"
    t.integer "crunches"
    t.integer "squatjacks"
    t.integer "user_id"
    t.integer "day"
  end

  create_table "stats", force: :cascade do |t|
    t.string "gender"
    t.integer "age"
    t.integer "weight"
    t.integer "height"
    t.integer "user_id"
    t.integer "day"
    t.integer "calories"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
  end

end
