class TimelinesController < ApplicationController
	before_filter :authenticate_user!

	def show
		@user = User.find_by_username(params[:username])
		@meals = Meal.where(user_id: @user.id).order("created_at DESC").paginate(:page => params[:page], :per_page => 6)
	end
end