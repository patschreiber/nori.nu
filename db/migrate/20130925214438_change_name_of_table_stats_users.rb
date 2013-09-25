class ChangeNameOfTableStatsUsers < ActiveRecord::Migration
  def up
    rename_table :stats_users, :users_stats
  end

  def down
    rename_table :users_stats, :stats_users
  end
end
