class RemoveColumnsFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :drop_percentage, :integer
    remove_column :items, :uses_ammo, :boolean
    remove_column :items, :ammo_type, :integer
  end
end
