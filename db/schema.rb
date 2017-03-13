# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170105114422) do

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "password"
    t.string   "city"
    t.string   "address"
    t.text     "auth_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "details", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "name"
    t.integer  "qty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_details_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "gate"
    t.string   "delivery"
    t.string   "remark"
    t.string   "payment"
    t.boolean  "status"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["department_id"], name: "index_orders_on_department_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "brand"
    t.string   "group"
    t.integer  "price"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["department_id"], name: "index_products_on_department_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["department_id"], name: "index_staffs_on_department_id"
  end

end
