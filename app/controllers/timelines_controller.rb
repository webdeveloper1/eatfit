class TimelinesController < ApplicationController
	before_filter :authenticate_user!

	# def show
	# 	@user = current_user
	# 	@meals = current_user.meals.order("created_at DESC").paginate(:page => params[:page], :per_page => 6)
	# end

	def show
		@user = User.find_by_username(params[:username])
		if @user.id == current_user.id
			@meals = Meal.where(user_id: @user.id).order("created_at DESC").paginate(:page => params[:page], :per_page => 6)
		else
			@meals = Meal.where(user_id: @user.id).where(private: false).order("created_at DESC").paginate(:page => params[:page], :per_page => 6)
		end
	end
end