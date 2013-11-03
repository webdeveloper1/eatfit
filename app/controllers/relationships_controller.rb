class RelationshipsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@relationships = current_user.following_relationships
	end

	def create
		leader = User.find(params[:leader_id])
		Relationship.create(leader_id: params[:leader_id], follower: current_user) if current_user.can_follow?(leader)
		redirect_to search_path
	end

	def destroy
		relationship = Relationship.find(params[:id])
		relationship.destroy if relationship.follower == current_user
		redirect_to friends_path
	end
end