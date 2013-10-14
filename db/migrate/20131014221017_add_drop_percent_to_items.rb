class AddDropPercentToItems < ActiveRecord::Migration
  def up
    add_column :items, :drop_percentage, :float, :after => :luck_max
  end

  def down
    remove_column :items, :drop_percentage
  end
end
