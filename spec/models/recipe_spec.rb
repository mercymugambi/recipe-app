require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'associations' do
    before(:each) do
      @user = User.create(email: 'test@example.com', password: 'password')
      @food1 = Food.create(name: 'Pizza', user: @user)
      @food2 = Food.create(name: 'Burger', user: @user)
      @recipe = Recipe.create(name: 'Pizza Burger', user: @user)
      RecipeFood.create(recipe: @recipe, food: @food1, quantity: 1)
      RecipeFood.create(recipe: @recipe, food: @food2, quantity: 2)
    end

    it 'should belong to a user' do
      expect(@recipe.user).to eq(@user)
    end

    it 'should have many foods through recipe_foods' do
      expect(@recipe.foods).to include(@food1, @food2)
    end
  end
end
