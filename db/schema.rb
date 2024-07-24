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

ActiveRecord::Schema[7.1].define(version: 2024_07_24_131017) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authorization_logs", force: :cascade do |t|
    t.text "ip", null: false
    t.integer "token_type", default: 0, null: false
    t.text "token", null: false
    t.datetime "expired_at", precision: nil, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "openai_logs", force: :cascade do |t|
    t.text "api"
    t.text "params"
    t.text "model"
    t.text "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.text "name"
    t.text "usage"
    t.text "target_audience"
    t.text "difference"
    t.text "highlight"
    t.text "style"
    t.text "guidance"
    t.text "competitor"
    t.text "length"
    t.text "extra"
    t.text "intro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
