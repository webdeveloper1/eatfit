class MealsController < ApplicationController
	before_filter :authenticate_user!

	def show
		@meal = Meal.find(params[:id])
		@comments = @meal.comments
	end

	def create
		@meal = current_user.meals.build(meal_params)
		if @meal.save
			redirect_to dashboard_path
		else
			# display error message
			redirect_to dashboard_path
		end
	end

	private

		def meal_params
			params.require(:meal).permit(:picture)
		end
end