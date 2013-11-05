class Meal < ActiveRecord::Base
	belongs_to :user
	has_many :comments

	mount_uploader :picture, MealUploader

	validates_presence_of :picture

	def self.from_users_followed_by(user)
		following_relationship_ids = "SELECT leader_id FROM relationships WHERE follower_id = :user_id"
		where("user_id IN (#{following_relationship_ids})", user_id: user.id)
	end
end