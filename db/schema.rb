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

ActiveRecord::Schema.define(version: 20250419155548) do

  create_table "workout_plans", force: :cascade do |t|
    t.string   "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "completed"
  end

  create_table "workouts", force: :cascade do |t|
    t.string   "name"
    t.integer  "sets"
    t.integer  "reps"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "workout_plan_id"
  end

  add_index "workouts", ["workout_plan_id"], name: "index_workouts_on_workout_plan_id"

end
