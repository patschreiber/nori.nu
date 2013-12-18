class RemoveColumnsFromGameFoundItems < ActiveRecord::Migration
  def up
    remove_column :game_found_items, :attack_min
    remove_column :game_found_items, :attack_max
    remove_column :game_found_items, :defense_min
    remove_column :game_found_items, :defense_max
    remove_column :game_found_items, :stealth_min
    remove_column :game_found_items, :stealth_max
    remove_column :game_found_items, :luck_min
    remove_column :game_found_items, :luck_max
  end

  def down
    add_column :game_found_items, :attack_min, :integer, :after => :can_have_suffix
    add_column :game_found_items, :attack_max, :integer, :after => :attack_min
    add_column :game_found_items, :defense_min, :integer, :after => :computed_attack
    add_column :game_found_items, :defense_max, :integer, :after => :defense_min
    add_column :game_found_items, :stealth_min, :integer, :after => :computed_defense
    add_column :game_found_items, :stealth_max, :integer, :after => :stealth_min
    add_column :game_found_items, :luck_min, :integer, :after => :computed_stealth
    add_column :game_found_items, :luck_max, :integer, :after => :luck_min
  end
end
