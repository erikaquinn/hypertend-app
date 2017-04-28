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

ActiveRecord::Schema.define(version: 20170423041925) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blood_pressures", force: :cascade do |t|
    t.integer  "systolic_number"
    t.integer  "diastolic_number"
    t.integer  "bpm"
    t.string   "measurement_arm"
    t.integer  "weight"
    t.string   "notes"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "bp_meals", force: :cascade do |t|
    t.integer  "meal_id"
    t.integer  "blood_pressure_id"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "food_items", force: :cascade do |t|
    t.string   "description"
    t.integer  "sodium"
    t.integer  "calories"
    t.integer  "cholesterol"
    t.integer  "protein"
    t.integer  "potassium"
    t.integer  "sugar"
    t.integer  "meal_id"
    t.string   "notes"
    t.integer  "bp_meal_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "meals", force: :cascade do |t|
    t.string   "name"
    t.integer  "sodium_total"
    t.integer  "calories_total"
    t.integer  "cholesterol_total"
    t.integer  "protein_total"
    t.integer  "potassium_total"
    t.integer  "sugar_total"
    t.integer  "bp_meal_id"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "smoker"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
