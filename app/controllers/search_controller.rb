class SearchController < ApplicationController
	before_filter :authenticate_user!

	def search
		@followingusers = current_user.following_relationships.map(&:leader)
		@users = User.all_except(current_user).where("id NOT IN (?)", @followingusers.map(&:id))
	end

	def result
		@results = User.all_except(current_user).search_by_username(params[:search_term])
	end
end