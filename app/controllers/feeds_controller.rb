class FeedsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@feed_items = current_user.meal_feed.order("created_at DESC")
	end
end