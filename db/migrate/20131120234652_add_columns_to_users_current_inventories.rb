class AddColumnsToUsersCurrentInventories < ActiveRecord::Migration
  def up
    add_column :users_current_inventories, :name, :string, :after => :item_id
    add_column :users_current_inventories, :is_equippable, :boolean, :after => :name
    add_column :users_current_inventories, :min_equip_player_level, :integer, :after => :is_equippable
    add_column :users_current_inventories, :equip_slot, :integer, :after => :min_equip_player_level
    add_column :users_current_inventories, :uses_ammo, :boolean, :after => :equip_slot
    add_column :users_current_inventories, :ammo_type, :integer, :after => :uses_ammo
    add_column :users_current_inventories, :is_consumable, :boolean, :after => :ammo_type
    add_column :users_current_inventories, :is_currency, :boolean, :after => :is_consumable
    add_column :users_current_inventories, :is_set, :boolean, :after => :is_currency
    add_column :users_current_inventories, :set_id, :integer, :after => :is_set
    add_column :users_current_inventories, :set_item_number, :integer, :after => :set_id
    add_column :users_current_inventories, :value, :integer, :after => :set_item_number
    add_column :users_current_inventories, :is_unique, :boolean, :after => :value
    add_column :users_current_inventories, :can_have_prefix, :boolean, :after => :is_unique
    add_column :users_current_inventories, :can_have_suffix, :boolean, :after => :can_have_prefix
    add_column :users_current_inventories, :attack_min, :bool, :after => :can_have_suffix
    add_column :users_current_inventories, :attack_max, :integer, :after => :attack_min
    add_column :users_current_inventories, :computed_attack, :integer, :after => :attack_max
    add_column :users_current_inventories, :defense_min, :integer, :after => :computed_attack
    add_column :users_current_inventories, :defense_max, :integer, :after => :defense_min
    add_column :users_current_inventories, :computed_defense, :integer, :after => :defense_max
    add_column :users_current_inventories, :stealth_min, :integer, :after => :computed_defense
    add_column :users_current_inventories, :stealth_max, :integer, :after => :stealth_min
    add_column :users_current_inventories, :computed_stealth, :integer, :after => :stealth_max
    add_column :users_current_inventories, :luck_min, :integer, :after => :computed_stealth
    add_column :users_current_inventories, :luck_max, :integer, :after => :luck_min
    add_column :users_current_inventories, :computed_luck, :integer, :after => :luck_max
    add_column :users_current_inventories, :flavor_text, :text, :after => :computed_luck
  end

  def down
    drop_column :users_current_inventories, :name
    add_column :users_current_inventories, :is_equippable
    add_column :users_current_inventories, :min_equip_player_level
    add_column :users_current_inventories, :equip_slot
    add_column :users_current_inventories, :uses_ammo
    add_column :users_current_inventories, :ammo_type
    add_column :users_current_inventories, :is_consumable
    add_column :users_current_inventories, :is_currency
    add_column :users_current_inventories, :is_set
    add_column :users_current_inventories, :set_id
    add_column :users_current_inventories, :set_item_number
    add_column :users_current_inventories, :value
    add_column :users_current_inventories, :is_unique
    add_column :users_current_inventories, :can_have_prefix
    add_column :users_current_inventories, :can_have_suffix
    add_column :users_current_inventories, :attack_min
    add_column :users_current_inventories, :attack_max
    add_column :users_current_inventories, :computed_attack
    add_column :users_current_inventories, :defense_min
    add_column :users_current_inventories, :defense_max
    add_column :users_current_inventories, :computed_defense
    add_column :users_current_inventories, :stealth_min
    add_column :users_current_inventories, :stealth_max
    add_column :users_current_inventories, :computed_stealth
    add_column :users_current_inventories, :luck_min
    add_column :users_current_inventories, :luck_max
    add_column :users_current_inventories, :computed_luck
    add_column :users_current_inventories, :flavor_text
  end
end
