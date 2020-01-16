# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_16_050601) do

  create_table "companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "company", primary_key: "company_id", id: :integer, limit: 2, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "company_name", limit: 45, null: false
    t.string "company_street", limit: 20, null: false
    t.string "company_col", limit: 20, null: false
    t.string "company_int", limit: 6
    t.string "company_ext", limit: 6, null: false
    t.string "company_code", limit: 6, null: false
    t.string "company_city", limit: 20, null: false
    t.string "company_country", limit: 20, null: false
  end

  create_table "company_has_employee", primary_key: "Che_id", id: :integer, limit: 2, unsigned: true, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "employee_id", limit: 2, null: false, unsigned: true
    t.integer "company_id", limit: 2, null: false, unsigned: true
    t.index ["company_id"], name: "fk_company_id_company_has_employee_fk_idx"
    t.index ["employee_id"], name: "fk_employee_id_company_has_employee_fk_idx"
  end

  create_table "employee", primary_key: "employee_id", id: :integer, limit: 2, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "employee_name", limit: 20, null: false
    t.string "employee_surname", limit: 20, null: false
    t.string "employee_email", limit: 45, null: false
    t.string "employee_rfc", limit: 13, null: false
  end

  create_table "user", primary_key: "user_id", id: :integer, limit: 2, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "user_password", limit: 45, null: false
    t.integer "employee_id", limit: 2, null: false, unsigned: true
    t.index ["employee_id"], name: "fx_employee_id_user_fk_idx"
  end

  add_foreign_key "company_has_employee", "company", primary_key: "company_id", name: "fk_company_id_company_has_employee_fk"
  add_foreign_key "company_has_employee", "employee", primary_key: "employee_id", name: "fk_employee_id_company_has_employee_fk"
  add_foreign_key "user", "employee", primary_key: "employee_id", name: "fx_employee_id_user_fk"
end
