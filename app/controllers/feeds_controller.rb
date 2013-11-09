class FeedsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@activities = PublicActivity::Activity.order("created_at desc").where("owner_id IN (?) OR recipient_id IN (?)", current_user.leader_ids, current_user.id)
	end
end