class Comment < ActiveRecord::Base
	include PublicActivity::Common

	belongs_to :user
	belongs_to :meal, :dependent => :destroy

end