# == Schema Information
#
# Table name: users_equipped_items
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  slot_1             :integer
#  slot_1_is_equipped :boolean
#  slot_2             :integer
#  slot_2_is_equipped :boolean
#  slot_3             :integer
#  slot_3_is_equipped :boolean
#  slot_4             :integer
#  slot_4_is_equipped :boolean
#  slot_5             :integer
#  slot_5_is_equipped :boolean
#  slot_6             :integer
#  slot_6_is_equipped :boolean
#  slot_7             :integer
#  slot_7_is_equipped :boolean
#  created_at         :datetime
#  updated_at         :datetime
#

class UsersEquippedItem < ActiveRecord::Base
  belongs_to :user


end
