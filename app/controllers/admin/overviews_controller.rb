class Admin::OverviewsController < ApplicationController
	before_filter :authenticate_user!, :require_admin

	def index
		@users = User.order("sign_in_count DESC")
	end

	private

		def require_admin
			redirect_to root_path unless current_user.admin? == true
		end
end