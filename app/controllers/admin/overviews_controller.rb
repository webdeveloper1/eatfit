class Admin::OverviewsController < ApplicationController
	before_filter :authenticate_user!, :require_admin

	def index
	end

	def users
		@users = User.order("created_at DESC")
	end

	def meals
		@meals = Meal.order("created_at DESC").limit(10)
	end

	def comments
		@comments = Comment.order("created_at DESC").limit(50)
	end

	private

		def require_admin
			redirect_to root_path unless current_user.admin? == true
		end
end