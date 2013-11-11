class ContactMailer < ActionMailer::Base
	def contact_message(contact)
		@contact = contact

		mail 	to: "info@eatfit.cc",
					from: @contact.email,
					subject: "New contact message"
	end
end