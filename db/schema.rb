# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_24_163243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "content_types", force: :cascade do |t|
    t.string "name", limit: 50
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_content_types_on_name", unique: true
  end

  create_table "contents", force: :cascade do |t|
    t.jsonb "body"
    t.string "url", limit: 500
    t.string "resource", limit: 60
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "content_type_id"
    t.index ["body"], name: "index_contents_on_body", using: :gin
    t.index ["content_type_id"], name: "index_contents_on_content_type_id"
  end

  add_foreign_key "contents", "content_types"
end
