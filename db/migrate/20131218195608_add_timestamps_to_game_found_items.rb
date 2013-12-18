class AddTimestampsToGameFoundItems < ActiveRecord::Migration
  def up
    add_column :game_found_items, :created_at, :datetime, :after => :flavor_text
    add_column :game_found_items, :updated_at, :datetime, :after => :created_at
  end

  def down
    remove_column :game_found_items, :created_at
    remove_column :game_found_items, :updated_at
  end
end
