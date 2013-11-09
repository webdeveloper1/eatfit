class FeedsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@activities = PublicActivity::Activity.order("created_at desc").where(owner_id: User.friend_ids(current_user).ids, owner_type: "User")
	end
end