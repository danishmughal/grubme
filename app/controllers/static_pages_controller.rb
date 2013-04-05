class StaticPagesController < ApplicationController
	def home
		@pubmeals = Meal.where(:public => true)

		if !current_user.nil?
		    @image = current_user.image.sub 'square', 'large'
		end
	end




end