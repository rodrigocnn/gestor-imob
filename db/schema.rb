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

ActiveRecord::Schema[7.2].define(version: 2025_06_03_122438) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "cpf"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string "name"
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_neighborhoods_on_city_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "cpf"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string "title"
    t.string "negotiation_type"
    t.text "description"
    t.integer "bedrooms"
    t.integer "bathrooms"
    t.integer "suites"
    t.float "price"
    t.float "latitude"
    t.float "longitude"
    t.string "neighborhood"
    t.string "state"
    t.string "address"
    t.bigint "city_id", null: false
    t.bigint "property_type_id", null: false
    t.bigint "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "property_code"
    t.index ["city_id"], name: "index_properties_on_city_id"
    t.index ["owner_id"], name: "index_properties_on_owner_id"
    t.index ["property_code"], name: "index_properties_on_property_code", unique: true
    t.index ["property_type_id"], name: "index_properties_on_property_type_id"
  end

  create_table "property_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rent_payments", force: :cascade do |t|
    t.bigint "rental_contract_id", null: false
    t.datetime "due_date"
    t.datetime "payment_date"
    t.float "amount"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rental_contract_id"], name: "index_rent_payments_on_rental_contract_id"
  end

  create_table "rental_contracts", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "property_id", null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.float "monthly_rent"
    t.float "deposit_amount"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "contract_code"
    t.index ["client_id"], name: "index_rental_contracts_on_client_id"
    t.index ["contract_code"], name: "index_rental_contracts_on_contract_code", unique: true
    t.index ["property_id"], name: "index_rental_contracts_on_property_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "neighborhoods", "cities"
  add_foreign_key "properties", "cities"
  add_foreign_key "properties", "owners"
  add_foreign_key "properties", "property_types"
  add_foreign_key "rent_payments", "rental_contracts"
  add_foreign_key "rental_contracts", "clients"
  add_foreign_key "rental_contracts", "properties"
end
