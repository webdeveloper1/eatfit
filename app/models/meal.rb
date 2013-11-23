class Meal < ActiveRecord::Base
	include PublicActivity::Common
	before_create :generate_token

	belongs_to :user
	has_many :comments
	has_many :votes, as: :voteable

	mount_uploader :picture, MealUploader

	validates_presence_of :picture

	def to_param
		self.token
	end

	def generate_token
		self.token = SecureRandom.urlsafe_base64(10)
	end
end