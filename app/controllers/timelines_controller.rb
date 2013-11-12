class TimelinesController < ApplicationController
	before_filter :authenticate_user!

	def show
		@user = current_user
		@meals = current_user.meals.order("created_at DESC").paginate(:page => params[:page], :per_page => 6)
	end
end