class AddPrivateToMeals < ActiveRecord::Migration
  def change
  	add_column :meals, :private, :boolean, default: true
  end
end
