class Food < ApplicationRecord
  has_many :recipe_foods
  belongs_to :user, foreign_key: 'user_id_id', class_name: 'User'
end
