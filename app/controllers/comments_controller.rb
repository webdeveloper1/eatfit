class CommentsController < ApplicationController
	before_filter :authenticate_user!

	def create
		@meal = Meal.find_by_token(params[:meal_id])
		@comment = @meal.comments.build(comment_params.merge!(user: current_user))
		if @comment.save
			@comment.create_activity :create, owner: current_user, recipient: @meal.user
			redirect_to @meal
		else
			# error message
			redirect_to @meal
		end
	end

	private

		def comment_params
			params.require(:comment).permit(:content)
		end
end