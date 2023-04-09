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

ActiveRecord::Schema.define(version: 2023_04_08_080009) do

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.date "delete_at"
    t.integer "user_id", null: false
    t.integer "resume_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resume_id"], name: "index_comments_on_resume_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "tel"
    t.string "skill"
    t.text "intro"
    t.string "city"
    t.text "education"
    t.text "experience"
    t.text "portfolio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.integer "user_id"
    t.index ["deleted_at"], name: "index_resumes_on_deleted_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "nicknaem"
    t.date "birthday"
    t.integer "role"
    t.integer "gender"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "comments", "resumes"
  add_foreign_key "comments", "users"
end
