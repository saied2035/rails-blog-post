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

ActiveRecord::Schema[7.0].define(version: 2022_06_09_104033) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comment", force: :cascade do |t|
    t.bigint "Author_id"
    t.bigint "Post_id"
    t.text "Text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Author_id"], name: "index_comment_on_Author_id"
    t.index ["Post_id"], name: "index_comment_on_Post_id"
  end

  create_table "like", force: :cascade do |t|
    t.bigint "Author_id"
    t.bigint "Post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Author_id"], name: "index_like_on_Author_id"
    t.index ["Post_id"], name: "index_like_on_Post_id"
  end

  create_table "post", force: :cascade do |t|
    t.bigint "Author_id"
    t.string "Title", limit: 32
    t.text "Text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "CommentsCounter"
    t.bigint "LikesCounter"
    t.index ["Author_id"], name: "index_post_on_Author_id"
  end

  create_table "user", force: :cascade do |t|
    t.string "Name", limit: 32
    t.string "Photo", limit: 2000
    t.text "Bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "PostsCounter"
  end

  add_foreign_key "comment", "\"user\"", column: "Author_id"
  add_foreign_key "comment", "post", column: "Post_id"
  add_foreign_key "like", "\"user\"", column: "Author_id"
  add_foreign_key "like", "post", column: "Post_id"
  add_foreign_key "post", "\"user\"", column: "Author_id"
end
