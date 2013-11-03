class PagesController < ApplicationController
	def front
		redirect_to upload_path if current_user
	end
end