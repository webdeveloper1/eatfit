class MealsController < ApplicationController
	before_filter :authenticate_user!, except: [:show]
	before_filter :secure_meal, only: [:show]

	def show
		@meal = Meal.find(params[:id])
		@comments = @meal.comments
	end

	def create
		@meal = current_user.meals.build(meal_params)
		if @meal.save
			@meal.create_activity :create, owner: current_user
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

	def share
		@meal = Meal.find(params[:id])
		@meal.update_attributes(private: false) if @meal.user.id == current_user.id
		redirect_to showcases_path
	end

	private

		def meal_params
			params.require(:meal).permit(:picture)
		end

		def secure_meal
			@meal = Meal.find(params[:id])
			if @meal.private == true
				authenticate_user!
				redirect_to root_path unless @meal.user == current_user
			end
		end
end