class RemoveUserIdFieldFromUsersEquippedItemAndUsersStats < ActiveRecord::Migration
  def up
    remove_column :users_stats, :user_id
    remove_column :users_equipped_items, :user_id
  end

  def down
    add_column :users_stats, :user_id, :integer, :after => :id
    add_column :users_equipped_items, :user_id, :integer, :after => :id
  end
end
