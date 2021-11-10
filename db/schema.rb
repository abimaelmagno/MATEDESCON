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

ActiveRecord::Schema.define(version: 2021_11_09_001524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banks", force: :cascade do |t|
    t.string "name"
    t.integer "value"
    t.bigint "firma_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["firma_id"], name: "index_banks_on_firma_id"
  end

  create_table "firmas", force: :cascade do |t|
    t.string "name"
    t.string "sector"
    t.integer "capital", default: 10000
    t.integer "product", default: 0
    t.integer "compras"
    t.integer "vendas"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_firmas_on_user_id"
  end

  create_table "fonecedors", force: :cascade do |t|
    t.string "nome_empresa"
    t.string "nome_produto"
    t.integer "estoque"
    t.integer "price"
    t.date "prazo_pagamento"
    t.bigint "firma_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["firma_id"], name: "index_fonecedors_on_firma_id"
  end

  create_table "fornecedors", force: :cascade do |t|
    t.string "name"
    t.string "name_produto"
    t.integer "estoque"
    t.integer "preco"
    t.date "prazo"
    t.bigint "firma_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["firma_id"], name: "index_fornecedors_on_firma_id"
  end

  create_table "lancamentos", force: :cascade do |t|
    t.string "tipo"
    t.date "date"
    t.integer "value"
    t.bigint "firma_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "quantity"
    t.index ["firma_id"], name: "index_lancamentos_on_firma_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "course"
    t.integer "period"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "banks", "firmas"
  add_foreign_key "firmas", "users"
  add_foreign_key "fonecedors", "firmas"
  add_foreign_key "fornecedors", "firmas"
  add_foreign_key "lancamentos", "firmas"
end
