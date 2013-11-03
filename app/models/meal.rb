class Meal < ActiveRecord::Base
	belongs_to :user
	has_many :comments

	mount_uploader :picture, MealUploader

	validates_presence_of :picture
end