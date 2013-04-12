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


  def self.get_coordinates(meal)
  		require 'open-uri'
		require 'json'

		@location = meal.location.sub ' ', '+'
		@city = meal.city.sub ' ', '+'
		@state = meal.state.sub ' ', '+'

		@result = JSON.parse(open("https://maps.googleapis.com/maps/api/place/textsearch/json?query=+#{@location}+#{@city}+#{@state}+&sensor=true&key=AIzaSyDaZ6y5ImLfUW9Ne_HvnrU0T5E16Lkyv4w").read)

		@pricelevel = @result["results"].first["price_level"]
		@rating = @result["results"].first["rating"]

		@address = @result["results"].first["formatted_address"]

		@latlng = []

		@latlng[0] = @result["results"].first["geometry"]["location"]["lat"]
		@latlng[1] = @result["results"].first["geometry"]["location"]["lng"]

		return @latlng
  end

end
