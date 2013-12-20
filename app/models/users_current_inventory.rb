# == Schema Information
#
# Table name: users_current_inventories
#
#  id                     :integer          not null, primary key
#  user_id                :integer
#  item_id                :integer
#  name                   :string(255)
#  is_equippable          :boolean
#  min_equip_player_level :integer
#  tier                   :integer
#  equip_slot             :integer
#  uses_ammo              :boolean
#  ammo_type              :integer
#  is_consumable          :boolean
#  is_currency            :boolean
#  is_set                 :boolean
#  set_id                 :integer
#  set_item_number        :integer
#  value                  :integer
#  is_unique              :boolean
#  can_have_prefix        :boolean
#  prefix                 :string(255)
#  can_have_suffix        :boolean
#  suffix                 :string(255)
#  computed_attack        :integer
#  computed_defense       :integer
#  computed_stealth       :integer
#  computed_luck          :integer
#  flavor_text            :text
#  quantity               :integer
#  inventory_place        :integer
#  created_at             :datetime
#  updated_at             :datetime
#

class UsersCurrentInventory < ActiveRecord::Base
  belongs_to :user

end
