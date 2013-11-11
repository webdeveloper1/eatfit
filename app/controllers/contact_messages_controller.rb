class ContactMessagesController < ApplicationController
	def new
	end

	def create
		@contact = ContactMessage.new(contact_message_params)
		if @contact.save
			ContactMailer.contact_message(@contact).deliver
			redirect_to root_path
		else
			flash[:error] = "Error. Please try again!"
			render 'new'
		end
	end

	private

		def contact_message_params
			params.require(:contact_message).permit(:email, :name, :message)
		end
end