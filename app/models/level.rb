# == Schema Information
#
# Table name: levels
#
#  id                  :integer          not null, primary key
#  level               :integer
#  experience_required :integer
#

class Level < ActiveRecord::Base
end
