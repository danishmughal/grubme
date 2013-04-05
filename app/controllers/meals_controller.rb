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


	def show
		
	end

end