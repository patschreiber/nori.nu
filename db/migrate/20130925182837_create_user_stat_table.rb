class CreateUserStatTable < ActiveRecord::Migration
  def up 
    create_table :stats_users do |t|
      t.integer :user_id
      t.integer :player_level
      t.integer :current_experience
      t.integer :total_experience
      t.integer :current_gold
      
      t.integer :health
      t.integer :attack
      t.integer :defense
      t.integer :stealth
      t.integer :luck

      t.integer :total_items_found
      t.integer :total_buttons_clicked
      t.integer :total_gold_collected

      t.timestamps

    end

    add_index :stats_users, [:player_level]

  end

  def down
    drop table :stats_users
  end
end
