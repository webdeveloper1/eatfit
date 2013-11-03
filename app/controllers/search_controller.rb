class SearchController < ApplicationController
	def search
		@users = User.all_except(current_user)
	end

	def result
		@results = User.search_by_username(params[:search_term])
	end
end