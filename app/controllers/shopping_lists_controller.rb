class ShoppingListsController < ApplicationController
  def index
    @foods = Food.where(user_id_id: current_user.id).order(created_at: :desc)
    @recipes = Recipe.where(user_id_id: current_user.id)
    @recipess = []
    @recipes.each do |recipe|
      @recipess << recipe.recipe_foods
    end

    @recipedfood = convert(@recipess)
    @genfood = converting(@foods)
    result = @genfood.reject { |obj| @recipedfood.map { |o| o[:food_id_id] }.include?(obj[:id]) }

    @shoppings = result
  end

  def convert(foood)
    foood.first.map do |recipe_food|
      {
        id: recipe_food.id,
        quantity: recipe_food.quantity,
        recipe_id_id: recipe_food.recipe_id_id,
        food_id_id: recipe_food.food_id_id,
        created_at: recipe_food.created_at,
        updated_at: recipe_food.updated_at,
        value: recipe_food.value
      }
    end
  end

  def converting(foood)
    foood.map do |row|
      {
        id: row.id,
        name: row.name,
        measurement_unit: row.measurement_unit,
        price: row.price,
        quantity: row.quantity,
        user_id_id: row.user_id_id,
        created_at: row.created_at,
        updated_at: row.updated_at
      }
    end
  end
end

#   recipe.recipe_foods do |recipe_food|
# end
