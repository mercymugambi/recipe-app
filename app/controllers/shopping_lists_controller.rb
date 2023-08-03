class ShoppingListsController < ApplicationController
    def index
        @foods = Food.where(user_id_id: current_user.id)
        @recipes = Recipe.foods
        @shoppings = @foods - @recipes

    end
end
