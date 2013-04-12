class MealsController < ApplicationController
	def new
		@meal = Meal.new
	end

	def create

=begin		
		mealtitle = params[:meal][:title]
		mealdesc = params[:meal][:description]
		mealtime = params[:meal][:mealtime]
		mealloc = params[:meal][:location]
		mealpub = params[:meal][:public]


		@meal = Meal.new( :title => mealtitle, :description => mealdesc, 
			:mealtime => mealtime, :location => mealloc, :public => mealpub, :user_id => current_user.id )
		@meal.save
=end
		@meal = Meal.new(params[:meal])
		@meal.user_id = current_user.id
		@meal.save

		redirect_to :root

	end

	def attendmeal
		@mealid = params[:id]

			@attending = Attending.new(:user_id => current_user.id, :lunch_id => @mealid)
			@attending.save

		redirect_to :root
	end

	def cancel
		@mealid = params[:id]

		@attending = Attending.where(:user_id => current_user.id, :lunch_id => @mealid).first.destroy

		redirect_to :root

	end


	def show
		@meal = Meal.find(params[:id])

		require 'open-uri'
		require 'json'

		@location = @meal.location.sub ' ', '+'
		@city = @meal.city.sub ' ', '+'
		@state = @meal.state.sub ' ', '+'

		@result = JSON.parse(open("https://maps.googleapis.com/maps/api/place/textsearch/json?query=+#{@location}+#{@city}+#{@state}+&sensor=true&key=AIzaSyDaZ6y5ImLfUW9Ne_HvnrU0T5E16Lkyv4w").read)

		@pricelevel = @result["results"].first["price_level"]
		@rating = @result["results"].first["rating"]

		@address = @result["results"].first["formatted_address"]


		@lat = @result["results"].first["geometry"]["location"]["lat"]
		@lng = @result["results"].first["geometry"]["location"]["lng"]


		@people = []

		@attendees = Attending.where(:lunch_id => @meal.id)
		@attendees.each do |a|
			@user = User.find(a.user_id)
			@people.push(@user)
		end

	end

end