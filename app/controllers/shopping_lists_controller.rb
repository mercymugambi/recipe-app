class ShoppingListsController < ApplicationController
  def index
    @foods = Food.where(user_id_id: current_user.id)
    @recipes = Recipe.all
    @recipess = []
    @recipes.each do |recipe|
      recipe.recipe_foods do |recipe_food|
        @recipess.push(recipe_food.food)
      end
    end
    def convert(foood)
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
    general_food = convert(@foods)
    reciped_food = convert(@recipess)
    
    result = general_food.reject { |obj| reciped_food.map { |o| o[:id] }.include?(obj[:id]) }

    @shoppings = result
  end
end
