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

ActiveRecord::Schema.define(version: 20131105000804) do

  create_table "game_found_items", force: true do |t|
    t.integer "base_item_id"
    t.string  "name"
    t.boolean "is_equippable"
    t.integer "min_equip_player_level"
    t.integer "tier"
    t.integer "equip_slot"
    t.boolean "uses_ammo"
    t.integer "ammo_type"
    t.boolean "is_consumable"
    t.boolean "is_currency"
    t.boolean "is_set"
    t.integer "set_id"
    t.integer "set_item_number"
    t.integer "value"
    t.boolean "is_unique"
    t.boolean "can_have_prefix"
    t.boolean "can_have_suffix"
    t.integer "attack_min"
    t.integer "attack_max"
    t.integer "computed_attack"
    t.integer "defense_min"
    t.integer "defense_max"
    t.integer "computed_defense"
    t.integer "stealth_min"
    t.integer "stealth_max"
    t.integer "computed_stealth"
    t.integer "luck_min"
    t.integer "luck_max"
    t.integer "computed_luck"
    t.text    "flavor_text"
  end

  add_index "item_prefixes", ["base_item_id"], name: "index_item_prefixes_on_base_item_id", using: :btree

  create_table "item_suffixes", force: true do |t|
    t.integer "base_item_id"
    t.string  "name"
    t.integer "attack_mod"
    t.integer "defense_mod"
    t.integer "stealth_mod"
    t.integer "luck_mod"
  end

  add_index "item_suffixes", ["base_item_id"], name: "index_item_suffixes_on_base_item_id", using: :btree

  create_table "items", force: true do |t|
    t.string  "name"
    t.boolean "is_equippable"
    t.integer "min_equip_player_level"
    t.integer "tier"
    t.integer "equip_slot"
    t.boolean "uses_ammo"
    t.integer "ammo_type"
    t.boolean "is_consumable"
    t.boolean "is_currency"
    t.boolean "is_set"
    t.integer "set_id"
    t.integer "set_item_number"
    t.integer "value"
    t.boolean "is_unique"
    t.boolean "can_have_prefix"
    t.boolean "can_have_suffix"
    t.integer "attack_min"
    t.integer "attack_max"
    t.integer "defense_min"
    t.integer "defense_max"
    t.integer "stealth_min"
    t.integer "stealth_max"
    t.integer "luck_min"
    t.integer "luck_max"
    t.float   "drop_percentage"
    t.text    "flavor_text"
  end

  create_table "levels", force: true do |t|
    t.integer "level"
    t.integer "experience_required"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, force: true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  create_table "users_current_inventory", force: true do |t|
    t.integer "item_id",         limit: 8
    t.integer "quantity"
    t.integer "inventory_place"
  end

  create_table "users_equipped_items", force: true do |t|
    t.integer  "user_id"
    t.integer  "slot_1",             limit: 8
    t.boolean  "slot_1_is_equipped"
    t.integer  "slot_2",             limit: 8
    t.boolean  "slot_2_is_equipped"
    t.integer  "slot_3",             limit: 8
    t.boolean  "slot_3_is_equipped"
    t.integer  "slot_4",             limit: 8
    t.boolean  "slot_4_is_equipped"
    t.integer  "slot_5",             limit: 8
    t.boolean  "slot_5_is_equipped"
    t.integer  "slot_6",             limit: 8
    t.boolean  "slot_6_is_equipped"
    t.integer  "slot_7",             limit: 8
    t.boolean  "slot_7_is_equipped"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users_stats", force: true do |t|
    t.integer  "user_id"
    t.integer  "player_level"
    t.integer  "current_experience"
    t.integer  "total_experience"
    t.integer  "current_gold"
    t.integer  "health"
    t.integer  "attack"
    t.integer  "defense"
    t.integer  "stealth"
    t.integer  "luck"
    t.integer  "total_items_found"
    t.integer  "total_buttons_clicked"
    t.integer  "total_gold_collected"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users_stats", ["player_level"], name: "index_users_stats_on_player_level", using: :btree

end
