class CreateUsersCurrentInventoryTable < ActiveRecord::Migration
  def up
    create_table :users_current_inventory do |t|
      t.integer :item_id, :limit => 8
      t.integer :quantity
      t.integer :inventory_place
    end
  end

  def down
    drop_table :users_current_inventory
  end
end
