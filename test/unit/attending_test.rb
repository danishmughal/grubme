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

require 'test_helper'

class AttendingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
