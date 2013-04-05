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

class Meal < ActiveRecord::Base
  attr_accessible :id, :title, :time_id, :location_id, :description, :mealtime, :location, :public, :user_id, :city, :state
  
  has_many :invitees
  belongs_to :user, :class_name => 'Meal', :foreign_key => 'user_id' # The creator of the meal

end
