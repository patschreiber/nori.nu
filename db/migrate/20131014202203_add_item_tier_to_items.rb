class AddItemTierToItems < ActiveRecord::Migration
  def up
    add_column :items, :tier, :integer, :after => :min_equip_player_level
  end

  def down
    remove_column :tier
  end
end
