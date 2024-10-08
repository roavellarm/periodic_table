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

ActiveRecord::Schema[7.2].define(version: 2024_10_06_190228) do
  create_table "annotations", force: :cascade do |t|
    t.text "content"
    t.integer "element_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["element_id"], name: "index_annotations_on_element_id"
  end

  create_table "elements", force: :cascade do |t|
    t.string "name"
    t.string "appearance"
    t.float "atomic_mass"
    t.float "boil"
    t.string "category"
    t.string "color"
    t.float "density"
    t.string "discovered_by"
    t.float "melt"
    t.float "molar_heat"
    t.string "named_by"
    t.integer "number"
    t.integer "period"
    t.string "phase"
    t.string "source"
    t.string "spectral_img"
    t.text "summary"
    t.string "symbol"
    t.integer "xpos"
    t.integer "ypos"
    t.string "electron_configuration"
    t.string "electron_configuration_semantic"
    t.float "electron_affinity"
    t.float "electronegativity_pauling"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ionization_energies", force: :cascade do |t|
    t.integer "element_id", null: false
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["element_id"], name: "index_ionization_energies_on_element_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "element_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["element_id"], name: "index_orders_on_element_id"
  end

  create_table "shells", force: :cascade do |t|
    t.integer "element_id", null: false
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["element_id"], name: "index_shells_on_element_id"
  end

  add_foreign_key "annotations", "elements"
  add_foreign_key "ionization_energies", "elements"
  add_foreign_key "orders", "elements"
  add_foreign_key "shells", "elements"
end
