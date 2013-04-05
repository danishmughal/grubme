# == Schema Information
#
# Table name: attendings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  lunch_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Attending < ActiveRecord::Base
  attr_accessible :user_id, :lunch_id

  belongs_to :user
  
end
