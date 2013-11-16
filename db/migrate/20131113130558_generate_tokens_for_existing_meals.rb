class GenerateTokensForExistingMeals < ActiveRecord::Migration
  def change
  	Meal.all.each do |meal|
  		meal.update_attribute(:token, SecureRandom.urlsafe_base64(10))
  	end
  end
end
