class RecipeFoodsController < ApplicationController
  before_action :set_recipe, except: [:new, :create]
  before_action :set_recipe_food, only: [:edit, :update, :destroy]

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

  def edit
    @foods = current_user.foods
  end

  def update
    if @recipe_food.update(recipe_food_params)
      redirect_to @recipe, notice: 'Recipe Food was successfully updated.'
    else
      @foods = current_user.foods
      render :edit
    end
  end

  def destroy
    @recipe_food.destroy
    redirect_to @recipe, notice: 'Recipe Food was successfully destroyed.'
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def set_recipe_food
    @recipe_food = @recipe.recipe_foods.find(params[:id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id_id, :quantity)
  end
end
