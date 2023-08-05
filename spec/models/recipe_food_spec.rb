require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  describe 'associations' do
    before(:each) do
      @user = User.create(email: 'test@example.com', password: 'password')
      @food = Food.create(name: 'Pizza', price: 10.0, user: @user)
      @recipe = Recipe.create(name: 'Pizza Burger', user: @user)
      @recipe_food = RecipeFood.create(recipe: @recipe, food: @food, quantity: 2)
    end

    it 'should belong to a recipe' do
      expect(@recipe_food.recipe).to eq(@recipe)
    end

    it 'should belong to a food' do
      expect(@recipe_food.food).to eq(@food)
    end
  end

  describe '#value' do
    before(:each) do
      @user = User.create(email: 'test@example.com', password: 'password')
      @food = Food.create(name: 'Pizza', price: 10.0, user: @user)
      @recipe = Recipe.create(name: 'Pizza Burger', user: @user)
      @recipe_food = RecipeFood.create(recipe: @recipe, food: @food, quantity: 2)
    end

    it 'should return the correct value' do
      expect(@recipe_food.value).to eq(20.0)
    end
  end
end
