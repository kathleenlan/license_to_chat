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

ActiveRecord::Schema.define(version: 20160102041657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text    "message"
    t.integer "license_plate_id"
  end

  add_index "comments", ["license_plate_id"], name: "index_comments_on_license_plate_id", using: :btree

  create_table "jurisdictions", force: :cascade do |t|
  end

  create_table "license_plates", force: :cascade do |t|
    t.string  "identifier"
    t.integer "jurisdiction_id"
  end

  add_index "license_plates", ["jurisdiction_id"], name: "index_license_plates_on_jurisdiction_id", using: :btree

end
