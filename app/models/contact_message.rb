class ContactMessage < ActiveRecord::Base
	validates_presence_of :email, :name, :message
end