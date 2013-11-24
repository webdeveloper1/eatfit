class SearchController < ApplicationController
	before_filter :authenticate_user!

	def search
		users_not_to_display = current_user.leader_ids
		users_not_to_display << current_user.id
		@users = User.where("id NOT IN (?)", users_not_to_display).limit(10)
	end

	def result
		@results = User.all_except(current_user).search_by_username(params[:search_term])
	end
end