class AddLevelTable < ActiveRecord::Migration
  def up
    create_table :levels do |t|
      t.integer :level
      t.integer :experience_required
    end
  end

  def down
    drop_table :levels
  end
end
