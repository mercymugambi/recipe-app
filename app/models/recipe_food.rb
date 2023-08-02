class RecipeFood < ApplicationRecord
  belongs_to :recipe, foreign_key: 'recipe_id_id'
  belongs_to :food, foreign_key: 'food_id_id'
end
