class RemoveExtraColumnsAndAddDatetimeToUsersCurrentInventories < ActiveRecord::Migration
  def up
    remove_column :users_current_inventories, :attack_min
    remove_column :users_current_inventories, :attack_max
    remove_column :users_current_inventories, :defense_min
    remove_column :users_current_inventories, :defense_max
    remove_column :users_current_inventories, :stealth_min
    remove_column :users_current_inventories, :stealth_max
    remove_column :users_current_inventories, :luck_min
    remove_column :users_current_inventories, :luck_max

    add_column :users_current_inventories, :created_at, :datetime, :after => :inventory_place
    add_column :users_current_inventories, :updated_at, :datetime, :after => :created_at
  end

  def down
    add_column :users_current_inventories, :attack_min, :integer, :after => :can_have_suffix
    add_column :users_current_inventories, :attack_max, :integer, :after => :attack_min
    add_column :users_current_inventories, :defense_min, :integer, :after => :computed_attack
    add_column :users_current_inventories, :defense_max, :integer, :after => :defense_min
    add_column :users_current_inventories, :stealth_min, :integer, :after => :computed_defense
    add_column :users_current_inventories, :stealth_max, :integer, :after => :stealth_min
    add_column :users_current_inventories, :luck_min, :integer, :after => :computed_stealth
    add_column :users_current_inventories, :luck_max, :integer, :after => :luck_min

    remove_column :users_current_inventories, :created_at, :datetime
    remove_column :users_current_inventories, :updated_at, :datetime
  end
end
