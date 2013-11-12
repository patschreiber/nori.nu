class AddUserIdToUsersStats < ActiveRecord::Migration
  def up
    add_column :users_stats, :user_id, :integer, :after => :id
  end

  def down
    remove_column :users_stats, :user_id
  end
end
