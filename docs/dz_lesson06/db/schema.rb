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

ActiveRecord::Schema.define(version: 2021_12_21_145501) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "marks", comment: "Оценки пользователей", force: :cascade do |t|
    t.integer "value", comment: "Числовое значение оценки"
    t.bigint "user_id"
    t.bigint "post_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_marks_on_post_id"
    t.index ["user_id"], name: "index_marks_on_user_id"
  end

  create_table "posts", comment: "Сообщения пользователей", force: :cascade do |t|
    t.string "title", comment: "Заголовок"
    t.text "content", comment: "Содержимое сообщения"
    t.bigint "user_id"
    t.boolean "active", default: true, comment: "Сообщение видно или не видно в системе"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", comment: "Пользователи системы", force: :cascade do |t|
    t.string "name", comment: "Имя пользователя"
    t.string "email", comment: "Электронный адрес пользователя"
    t.boolean "active", default: true, comment: "пользователь активен (true) или забанен (false)"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
  end

  add_foreign_key "marks", "posts"
  add_foreign_key "marks", "users"
  add_foreign_key "posts", "users"
end
