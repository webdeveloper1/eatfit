class RelationshipsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@relationships = current_user.following_relationships.paginate(:page => params[:page], :per_page => 8)
	end

	def create
		@leader = User.find(params[:leader_id])
		Relationship.create(leader_id: params[:leader_id], follower: current_user) if current_user.can_follow?(@leader)
		redirect_to_back_or_default(user_path(@leader.username))
	end

	def destroy
		relationship = Relationship.find(params[:id])
		relationship.destroy if relationship.follower == current_user
		redirect_to friends_path
	end

	def followers
		@followers = User.where("id IN (?)", current_user.follower_ids).paginate(:page => params[:page], :per_page => 8)
	end
end