class Meal < ActiveRecord::Base
	include PublicActivity::Common
	
	belongs_to :user
	has_many :comments

	mount_uploader :picture, MealUploader

	validates_presence_of :picture
end