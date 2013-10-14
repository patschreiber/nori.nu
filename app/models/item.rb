# == Schema Information
#
# Table name: items
#
#  id                     :integer          not null, primary key
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
#  can_have_suffix        :boolean
#  attack_min             :integer
#  attack_max             :integer
#  defense_min            :integer
#  defense_max            :integer
#  stealth_min            :integer
#  stealth_max            :integer
#  luck_min               :integer
#  luck_max               :integer
#  flavor_text            :text
#

class Item < ActiveRecord::Base
end
