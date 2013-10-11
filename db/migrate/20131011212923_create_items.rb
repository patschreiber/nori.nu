class CreateItems < ActiveRecord::Migration
  def up
    create_table :items do |t|
      t.string      :name
      t.boolean     :is_equippable
      t.integer     :min_equip_player_level
      t.integer     :equip_slot
      t.boolean     :uses_ammo
      t.integer     :ammo_type
      t.boolean     :is_consumable
      t.boolean     :is_currency
      t.boolean     :is_set 
      t.integer     :set_id
      t.integer     :set_item_number
      t.integer     :value
      t.boolean     :is_unique
      t.boolean     :can_have_prefix
      t.boolean     :can_have_suffix
      t.integer     :attack_min
      t.integer     :attack_max
      t.integer     :defense_min
      t.integer     :defense_max
      t.integer     :stealth_min
      t.integer     :stealth_max
      t.integer     :luck_min 
      t.integer     :luck_max
      t.text        :flavor_text
    end
  end

  def down
    drop_table :items
  end
end
