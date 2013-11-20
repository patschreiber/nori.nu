class AddAreasUnlockedToUsersStats < ActiveRecord::Migration
  def up
    add_column :users_stats, :areas_unlocked, :integer, :after => :total_gold_collected
  end

  def down
    drop_column :users_stats, :areas_unlocked
  end
end
