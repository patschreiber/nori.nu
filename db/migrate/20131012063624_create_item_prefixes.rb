class CreateItemPrefixes < ActiveRecord::Migration
  def up
    create_table :item_prefixes do |t|
      t.integer   :base_item_id
      t.string    :name
      t.integer   :attack_mod
      t.integer   :defense_mod
      t.integer   :stealth_mod
      t.integer   :luck_mod
    end

    add_index :item_prefixes, :base_item_id
  end

  def down
    remove_index :item_prefixes, :base_item_id
    drop_table :item_prefixes
  end
end