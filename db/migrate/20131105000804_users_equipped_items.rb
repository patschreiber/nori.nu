class UsersEquippedItems < ActiveRecord::Migration
  def up
    create_table :users_equipped_items do |t|
      t.integer :user_id
      t.integer :slot_1, :limit => 8
      t.boolean :slot_1_is_equipped

      t.integer :slot_2, :limit => 8
      t.boolean :slot_2_is_equipped

      t.integer :slot_3, :limit => 8
      t.boolean :slot_3_is_equipped

      t.integer :slot_4, :limit => 8
      t.boolean :slot_4_is_equipped

      t.integer :slot_5, :limit => 8
      t.boolean :slot_5_is_equipped

      t.integer :slot_6, :limit => 8
      t.boolean :slot_6_is_equipped

      t.integer :slot_7, :limit => 8
      t.boolean :slot_7_is_equipped

      t.timestamps
    end
  end

  def down
    drop_table :users_equipped_items
  end
end
