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

ActiveRecord::Schema.define(version: 20180203012251) do

  create_table "flyers", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.date     "birthdate"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.string   "apt"
    t.string   "city"
    t.integer  "zip"
    t.string   "school"
    t.integer  "feet"
    t.integer  "inches"
    t.string   "shirt"
    t.string   "ridebike"
    t.string   "physical"
    t.text     "actdesc"
    t.text     "whyjoin"
    t.text     "bikeexp"
    t.text     "athexp"
    t.text     "goal"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "riders", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.date     "birthdate"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.string   "apt"
    t.string   "city"
    t.integer  "zip"
    t.string   "school"
    t.integer  "feet"
    t.integer  "inches"
    t.string   "shirt"
    t.string   "ridebike"
    t.string   "physical"
    t.text     "actdesc"
    t.text     "whyjoin"
    t.text     "bikeexp"
    t.text     "athexp"
    t.text     "goal"
    t.integer  "flyer_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "notes"
    t.boolean  "waiver",     default: false
    t.text     "allergies"
    t.text     "health"
    t.date     "interview"
    t.boolean  "accepted",   default: false
    t.index ["flyer_id"], name: "index_riders_on_flyer_id"
  end

end
