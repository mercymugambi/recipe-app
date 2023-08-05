class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id_id'
  has_many :recipe_foods, foreign_key: 'recipe_id_id'
  has_many :foods, through: :recipe_foods
end
