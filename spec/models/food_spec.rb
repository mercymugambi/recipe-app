require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'associations' do
    before(:each) do
      @user = User.create(email: 'test@example.com', password: 'password')
      @food = Food.create(name: 'Pizza', user: @user)
      @recipe = Recipe.create(name: 'Pizza Burger', user: @user)
      RecipeFood.create(recipe: @recipe, food: @food, quantity: 1)
    end

    it 'should have Recipe belong to user' do
        expect(@recipe.user).to eq(@user)
    end

    it 'should belong to a user' do
      expect(@food.user).to eq(@user)
    end
  end
end
