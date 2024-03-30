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

ActiveRecord::Schema[7.1].define(version: 2024_03_31_032220) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "password"
    t.string "full_name", null: false
    t.string "email", null: false
    t.string "phone_number", null: false
    t.string "street_address1", null: false
    t.string "street_address2", null: false
    t.string "city", null: false
    t.string "postal_code", null: false
    t.bigint "province_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["province_id"], name: "index_customers_on_province_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
    t.decimal "price", precision: 10, scale: 2, null: false
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.integer "status", default: 0, null: false
    t.decimal "gst_rate", precision: 10, scale: 2
    t.decimal "pst_rate", precision: 10, scale: 2
    t.decimal "hst_rate", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "product_brands", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_categories", force: :cascade do |t|
    t.bigint "parent_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_product_categories_on_parent_id"
  end

  create_table "product_fitments", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "vehicle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id", "vehicle_id"], name: "index_product_fitments_on_product_id_and_vehicle_id", unique: true
    t.index ["product_id"], name: "index_product_fitments_on_product_id"
    t.index ["vehicle_id"], name: "index_product_fitments_on_vehicle_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "product_brand_id", null: false
    t.bigint "product_category_id", null: false
    t.string "product_number", null: false
    t.text "description", null: false
    t.decimal "price", precision: 10, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_brand_id"], name: "index_products_on_product_brand_id"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "pst_rate", precision: 10, scale: 2
    t.decimal "gst_rate", precision: 10, scale: 2
    t.decimal "hst_rate", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicle_makes", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicle_models", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.bigint "vehicle_make_id", null: false
    t.bigint "vehicle_model_id", null: false
    t.integer "year", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_make_id"], name: "index_vehicles_on_vehicle_make_id"
    t.index ["vehicle_model_id"], name: "index_vehicles_on_vehicle_model_id"
  end

  add_foreign_key "customers", "provinces"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "customers"
  add_foreign_key "product_categories", "product_categories", column: "parent_id"
  add_foreign_key "product_fitments", "products"
  add_foreign_key "product_fitments", "vehicles"
  add_foreign_key "products", "product_brands"
  add_foreign_key "products", "product_categories"
  add_foreign_key "vehicles", "vehicle_makes"
  add_foreign_key "vehicles", "vehicle_models"
end
