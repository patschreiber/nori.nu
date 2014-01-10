# == Schema Information
#
# Table name: users_areas
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  is_area_1_unlocked :boolean
#  is_area_2_unlocked :boolean
#  is_area_3_unlocked :boolean
#  is_area_4_unlocked :boolean
#  is_area_5_unlocked :boolean
#

class UsersArea < ActiveRecord::Base
  belongs_to :user
end
