class CreateContactMessages < ActiveRecord::Migration
  def change
    create_table :contact_messages do |t|
    	t.string :email, :name
    	t.text :message

    	t.timestamps
    end
  end
end
