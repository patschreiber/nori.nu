class AddNameToGameFoundItems < ActiveRecord::Migration
  def up
  add_column :game_found_items, :name, :string, :after => :base_item_id
  end

  def down
    remove_column :game_found_items, :name
  end
end
