class AddTokenToMeals < ActiveRecord::Migration
  def change
  	add_column :meals, :token, :string
  	add_index :meals, :token
  end
end
