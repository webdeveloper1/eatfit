class ShowcasesController < ApplicationController

	def index
		@meals = Meal.where(private: false).order("updated_at DESC").limit(20)
	end
end