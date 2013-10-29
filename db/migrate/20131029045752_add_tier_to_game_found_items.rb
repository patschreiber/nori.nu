class AddTierToGameFoundItems < ActiveRecord::Migration
  def up
    add_column :game_found_items, :tier, :integer, :after => :min_equip_player_level
  end

  def down
    remove_column :game_found_items, :tier
  end
end
