class AddCurrentAreaSelectedToUsersStats < ActiveRecord::Migration
  def up
    add_column :users_stats, :current_area_selected, :integer, :after => :current_gold
  end

  def down
    remove_column :users_stats, :current_area_selected
  end
end
