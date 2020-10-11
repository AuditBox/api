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

ActiveRecord::Schema.define(version: 2020_10_10_040208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "access_keys", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "write_key"
    t.string "secret_key"
    t.boolean "test", default: true
    t.uuid "organization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_access_keys_on_organization_id"
  end

  create_table "artifacts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "organization_id", null: false
    t.uuid "control_id", null: false
    t.uuid "asset_id"
    t.jsonb "props"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["asset_id"], name: "index_artifacts_on_asset_id"
    t.index ["control_id"], name: "index_artifacts_on_control_id"
    t.index ["organization_id"], name: "index_artifacts_on_organization_id"
  end

  create_table "assets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "organization_id", null: false
    t.jsonb "props", default: {}, null: false
    t.jsonb "tags", default: {}, null: false
    t.string "asset_type"
    t.string "handle"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_assets_on_organization_id"
  end

  create_table "control_scopes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "control_id", null: false
    t.uuid "scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["control_id", "scope_id"], name: "index_control_scopes_on_control_id_and_scope_id", unique: true
    t.index ["control_id"], name: "index_control_scopes_on_control_id"
    t.index ["scope_id"], name: "index_control_scopes_on_scope_id"
  end

  create_table "controls", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "organization_id", null: false
    t.string "handle"
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_controls_on_organization_id"
  end

  create_table "organizations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "scopes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.text "tags", default: [], array: true
    t.uuid "organization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "organization_id"], name: "index_scopes_on_name_and_organization_id", unique: true
    t.index ["organization_id"], name: "index_scopes_on_organization_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "google_id", null: false
    t.string "name"
    t.string "email"
    t.uuid "organization_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["google_id"], name: "index_users_on_google_id"
    t.index ["organization_id"], name: "index_users_on_organization_id"
  end

  add_foreign_key "access_keys", "organizations"
  add_foreign_key "artifacts", "assets"
  add_foreign_key "artifacts", "controls"
  add_foreign_key "artifacts", "organizations"
  add_foreign_key "assets", "organizations"
  add_foreign_key "control_scopes", "controls"
  add_foreign_key "control_scopes", "scopes"
  add_foreign_key "controls", "organizations"
  add_foreign_key "scopes", "organizations"
  add_foreign_key "users", "organizations"
end
