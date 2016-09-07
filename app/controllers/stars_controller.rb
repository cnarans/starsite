class StarsController < ApplicationController

	def show
		@star = Star.find(params[:id])
		@nearstars = @star.starsWithin(3.0)
		@nearstars = Star.distanceSort(@star, @nearstars)
	end
end
