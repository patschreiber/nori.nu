class AddTierToUsersCurrentInventories < ActiveRecord::Migration
  def up
    add_column :users_current_inventories, :tier, :integer, :after => :min_equip_player_level
  end

  def down
    remove_column :users_current_inventories, :tier
  end
end
