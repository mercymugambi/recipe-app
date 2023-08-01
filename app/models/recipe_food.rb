class RecipeFood < ApplicationRecord
  belongs_to :recipes, foreign_key: 'recipe_id_id'
  belongs_to :foods, foreign_key: 'food_id_id'
end
