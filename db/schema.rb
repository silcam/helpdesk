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

ActiveRecord::Schema.define(version: 20170724222551) do

  create_table "departements", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "depts", force: :cascade do |t|
    t.string "name"
  end

  create_table "devices", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "model"
    t.string "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stock"
    t.index ["user_id"], name: "index_devices_on_user_id"
  end

  create_table "job_requests", force: :cascade do |t|
    t.string "name_customer"
    t.string "department"
    t.string "email"
    t.string "telephone"
    t.string "priority"
    t.string "account_charge"
    t.integer "cash"
    t.string "device_name"
    t.string "model"
    t.string "parts_atteched"
    t.string "description_problem"
    t.date "date_arrive"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description_solution"
    t.integer "time_spent"
    t.date "date_return"
    t.string "statut"
    t.index ["user_id"], name: "index_job_requests_on_user_id"
  end

  create_table "sales", force: :cascade do |t|
    t.string "name_customer"
    t.date "datesale"
    t.integer "quantity"
    t.integer "device_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_sales_on_device_id"
    t.index ["user_id"], name: "index_sales_on_user_id"
  end

  create_table "solutions", force: :cascade do |t|
    t.string "description"
    t.string "time_spent"
    t.date "date_return"
    t.integer "job_resquest_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "statut"
    t.index ["job_resquest_id"], name: "index_solutions_on_job_resquest_id"
    t.index ["user_id"], name: "index_solutions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "email"
    t.string "telephone"
    t.string "login"
    t.string "password"
    t.string "privilege"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
