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

ActiveRecord::Schema[7.0].define(version: 2022_12_06_143027) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "csvs", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.integer "rowcount"
    t.boolean "processed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "csvuploads", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.integer "rowcount"
    t.boolean "processed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.string "url"
    t.string "shortUrl"
    t.integer "status"
    t.bigint "patterns_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patterns_id"], name: "index_links_on_patterns_id"
  end

  create_table "patterns", force: :cascade do |t|
    t.string "format"
    t.string "lastPatternUsed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "short_url_processors", force: :cascade do |t|
    t.string "url"
    t.string "shortUrl"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shorteners", force: :cascade do |t|
    t.string "url"
    t.string "shortUrl"
    t.integer "status"
    t.bigint "patterns_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patterns_id"], name: "index_shorteners_on_patterns_id"
  end

  create_table "shortlinks", force: :cascade do |t|
    t.string "url"
    t.string "shorturl"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "csvuploads_id"
    t.datetime "expiry_date"
    t.boolean "is_processed"
    t.boolean "is_successful"
    t.string "processing_notes"
    t.integer "visit_count"
    t.index ["csvuploads_id"], name: "index_shortlinks_on_csvuploads_id"
  end

  create_table "url_processors", force: :cascade do |t|
    t.string "url"
    t.string "shortUrl"
    t.integer "status"
    t.bigint "patterns_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patterns_id"], name: "index_url_processors_on_patterns_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "links", "patterns", column: "patterns_id"
  add_foreign_key "shorteners", "patterns", column: "patterns_id"
  add_foreign_key "shortlinks", "csvuploads", column: "csvuploads_id"
  add_foreign_key "url_processors", "patterns", column: "patterns_id"
end
