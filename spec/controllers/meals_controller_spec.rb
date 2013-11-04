require 'spec_helper'

describe MealsController do

	describe "GET show" do
		login_user
		it "assigns @meal for authenticated users" do
			alice = Fabricate(:user)
			meal = Fabricate(:meal, user_id: alice.id)
			get :show, id: meal.id
			expect(assigns(:meal)).to eq(meal)
		end
	end

	describe "POST create" do
		login_user
		it "creates a meal" do
			meal = Fabricate(:meal, user_id: current_user.id)
			post :create, meal: meal
			expect(Meal.count).to eq(1)
		end
	end
end