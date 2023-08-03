class ShoppingListsController < ApplicationController
  def index
    @foods = Food.where(user_id_id: current_user.id)
    @recipes = Recipe.where(user_id_id: current_user.id)
    @recipess = []
    @recipes.each do |recipe|
      @recipess << recipe.recipe_foods
    end
    def convert(foood)
      obj_food = foood.first.map do |recipe_food|
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
      return obj_food
    end
    def converting(foood)
      obj_food = foood.map do |row|
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
      return obj_food
    end
    @newRecipess = convert(@recipess)
    @genFood = converting(@foods)
    result = @genFood.reject { |obj| @newRecipess.map { |o| o[:food_id_id] }.include?(obj[:id]) }

    @shoppings = result
  end
end

  #   recipe.recipe_foods do |recipe_food|
  # end