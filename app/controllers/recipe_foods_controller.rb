# app/controllers/recipe_foods_controller.rb
class RecipeFoodsController < ApplicationController
  before_action :set_recipe

  def new
    @recipe_food = @recipe.recipe_foods.new
    @foods = current_user.foods
  end

  def create
    @recipe_food = @recipe.recipe_foods.new(recipe_food_params)
    if @recipe_food.save
      redirect_to @recipe, notice: 'Recipe Food was successfully added.'
    else
      @foods = current_user.foods
      render :new
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id_id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id_id, :quantity)
  end
end
