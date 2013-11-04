class MealsController < ApplicationController
	before_filter :authenticate_user!

	def show
		@meal = Meal.find(params[:id])
		@comments = @meal.comments
	end

	def create
		@meal = current_user.meals.build(meal_params)
		if @meal.save
			redirect_to upload_path
		else
			# display error message
			redirect_to upload_path
		end
	end

	def destroy
		@meal = Meal.find(params[:id])
		@meal.destroy if @meal.user_id == current_user.id
		redirect_to upload_path
	end

	private

		def meal_params
			params.require(:meal).permit(:picture)
		end
end