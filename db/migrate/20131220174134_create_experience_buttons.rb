class CreateExperienceButtons < ActiveRecord::Migration
  def up
    create_table :experience_buttons do |t|
      t.string :name
      t.string :class_name
      t.integer :experience_value
      t.string :description
      t.integer :button_cooldown
      t.timestamps
    end
  end

  def down
    drop_table :experience_buttons
  end
end
