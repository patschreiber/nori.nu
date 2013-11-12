# == Schema Information
#
# Table name: users_stats
#
#  id                    :integer          not null, primary key
#  user_id               :integer
#  player_level          :integer
#  current_experience    :integer
#  total_experience      :integer
#  current_gold          :integer
#  health                :integer
#  attack                :integer
#  defense               :integer
#  stealth               :integer
#  luck                  :integer
#  total_items_found     :integer
#  total_buttons_clicked :integer
#  total_gold_collected  :integer
#  created_at            :datetime
#  updated_at            :datetime
#

class UsersStat < ActiveRecord::Base
  belongs_to :user
end
