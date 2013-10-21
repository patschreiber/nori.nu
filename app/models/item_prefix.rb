# == Schema Information
#
# Table name: item_prefixes
#
#  id           :integer          not null, primary key
#  base_item_id :integer
#  name         :string(255)
#  attack_mod   :integer
#  defense_mod  :integer
#  stealth_mod  :integer
#  luck_mod     :integer
#

class ItemPrefix < ActiveRecord::Base
end
