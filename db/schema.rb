# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140315194910) do

  create_table "attachments", force: true do |t|
    t.integer  "intervention_id"
    t.integer  "field_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "attachments", ["field_id"], name: "index_attachments_on_field_id", using: :btree
  add_index "attachments", ["intervention_id"], name: "index_attachments_on_intervention_id", using: :btree

  create_table "fields", force: true do |t|
    t.integer  "schema_id"
    t.string   "name"
    t.integer  "element_order"
    t.string   "label"
    t.text     "description"
    t.boolean  "required"
    t.string   "type",          limit: 45
    t.text     "options"
    t.boolean  "remember"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
  end

  add_index "fields", ["permalink"], name: "index_fields_on_permalink", using: :btree
  add_index "fields", ["schema_id"], name: "index_fields_on_schema_id", using: :btree

# Could not dump table "geom" because of following StandardError
#   Unknown type 'geometry' for column 'g'

  create_table "hub_users", force: true do |t|
    t.integer  "hub_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hub_users", ["hub_id"], name: "index_hub_users_on_hub_id", using: :btree
  add_index "hub_users", ["user_id"], name: "index_hub_users_on_user_id", using: :btree

  create_table "hubs", force: true do |t|
    t.integer  "organization_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hubs", ["organization_id"], name: "index_hubs_on_organization_id", using: :btree

  create_table "interventions", force: true do |t|
    t.integer  "hub_id"
    t.integer  "status"
    t.text     "details",      limit: 2147483647
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "device_id"
    t.string   "phone_number"
    t.float    "location_lat"
    t.float    "location_lgt"
  end

  add_index "interventions", ["hub_id"], name: "index_interventions_on_hub_id", using: :btree

  create_table "organization_regions", force: true do |t|
    t.integer  "organization_id"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organization_regions", ["organization_id"], name: "index_organization_regions_on_organization_id", using: :btree
  add_index "organization_regions", ["region_id"], name: "index_organization_regions_on_region_id", using: :btree

  create_table "organization_schemas", force: true do |t|
    t.integer  "organization_id"
    t.integer  "schema_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organization_schemas", ["organization_id"], name: "index_organization_schemas_on_organization_id", using: :btree
  add_index "organization_schemas", ["schema_id"], name: "index_organization_schemas_on_schema_id", using: :btree

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "badge_file_name"
    t.string   "badge_content_type"
    t.integer  "badge_file_size"
    t.datetime "badge_updated_at"
  end

# Could not dump table "regions" because of following StandardError
#   Unknown type 'geometry' for column 'polygon'

  create_table "schedules", force: true do |t|
    t.integer  "organization_id"
    t.integer  "hub_id"
    t.string   "name"
    t.integer  "start_day"
    t.integer  "end_day"
    t.integer  "start_hour"
    t.integer  "end_hour"
    t.string   "type",            limit: 45
    t.text     "fallback"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schedules", ["hub_id"], name: "index_schedules_on_hub_id", using: :btree
  add_index "schedules", ["organization_id"], name: "index_schedules_on_organization_id", using: :btree

  create_table "schemas", force: true do |t|
    t.string   "label"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_schema_id"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "status"
    t.string   "password",   limit: 45
    t.string   "salt",       limit: 45
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
