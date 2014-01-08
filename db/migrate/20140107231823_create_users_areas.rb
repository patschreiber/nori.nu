class CreateUsersAreas < ActiveRecord::Migration
  def up
    create_table :users_areas do |t|
      t.integer :user_id
      t.boolean :is_area_1_unlocked
      t.boolean :is_area_2_unlocked
      t.boolean :is_area_3_unlocked
      t.boolean :is_area_4_unlocked
      t.boolean :is_area_5_unlocked
    end
  end

  def down
    drop_table :users_areas
  end
end
