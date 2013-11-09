class Comment < ActiveRecord::Base
	include PublicActivity::Common
	# tracked owner: ->(controller, model) { controller && controller.current_user }

	belongs_to :user
	belongs_to :meal, :dependent => :destroy

end