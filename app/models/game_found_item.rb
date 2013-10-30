# == Schema Information
#
# Table name: game_found_items
#
#  id                     :integer          not null, primary key
#  base_item_id           :integer
#  is_equippable          :boolean
#  min_equip_player_level :integer
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
#  computed_attack        :integer
#  defense_min            :integer
#  defense_max            :integer
#  computed_defense       :integer
#  stealth_min            :integer
#  stealth_max            :integer
#  computed_stealth       :integer
#  luck_min               :integer
#  luck_max               :integer
#  computed_luck          :integer
#  flavor_text            :text
#

class GameFoundItem < ActiveRecord::Base
end
