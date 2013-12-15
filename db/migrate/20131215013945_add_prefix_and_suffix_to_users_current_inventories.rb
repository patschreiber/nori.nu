class AddPrefixAndSuffixToUsersCurrentInventories < ActiveRecord::Migration
  def up
    add_column :users_current_inventories, :prefix, :string, :after => :can_have_prefix
    add_column :users_current_inventories, :suffix, :string, :after => :can_have_suffix
  end

  def down
    remove_column :users_current_inventories, :prefix
    remove_column :users_current_inventories, :suffix
  end
end
