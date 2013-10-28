class ChangeIdToBigIntGameFoundItems < ActiveRecord::Migration
  def change
    change_column :game_found_items, :id, :integer, :limit => 8
  end
end
