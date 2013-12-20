# == Schema Information
#
# Table name: experience_buttons
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  experience_value :integer
#  description      :string(255)
#  button_cooldown  :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class ExperienceButton < ActiveRecord::Base
end
