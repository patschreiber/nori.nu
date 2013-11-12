class AddUserIdToUsersCurrentInventories < ActiveRecord::Migration
  def up
    add_column :users_current_inventories, :user_id, :integer, :after => :id
  end

  def down
    remove_column :users_current_inventories, :user_id
  end
end
