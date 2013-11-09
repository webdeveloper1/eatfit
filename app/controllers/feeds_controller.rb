class FeedsController < ApplicationController
	before_filter :authenticate_user!

	def index
		# @activities = PublicActivity::Activity.order("created_at desc").where{(owner_id =~ User.friend_ids(current_user).ids) | (recipient_id =~ current_user.id)}
		# @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: User.friend_ids(current_user).ids, owner_type: "User")
		# @activities = PublicActivity::Activity.order("created_at desc").where(recipient_id: current_user.id, recipient_type: "User")
		# @activities = PublicActivity::Activity.order("created_at desc").where("owner_id IN ? OR recipient_id LIKE ?", User.friend_ids(current_user).ids, current_user.id)
		@activities = PublicActivity::Activity.order("created_at desc").where("owner_id IN (?) OR recipient_id IN (?)", User.friend_ids(current_user).ids, current_user.id)
	end
end