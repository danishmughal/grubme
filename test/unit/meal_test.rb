# == Schema Information
#
# Table name: meals
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  title       :string(255)
#  description :string(255)
#  location    :string(255)
#  public      :boolean          default(TRUE)
#  mealtime    :datetime
#

require 'test_helper'

class MealTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
