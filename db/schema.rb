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

ActiveRecord::Schema[7.1].define(version: 2024_03_18_224923) do
  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "authors"
    t.string "published_date"
    t.string "publisher"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "magazines", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "published_date"
    t.string "publisher"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "book_id", null: false
    t.index ["book_id"], name: "index_magazines_on_book_id"
  end

  add_foreign_key "magazines", "books"
end

create_table "authors", force: :cascade do |t|
  t.string "name"
  t.date "birth_date"
  t.text "biography"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
end

create_table "categories", force: :cascade do |t|
  t.string "name"
  t.text "description"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
end

create_table "publishers", force: :cascade do |t|
  t.string "name"
  t.text "address"
  t.text "contact_info"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
end