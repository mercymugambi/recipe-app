class CreateRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.integer :quantity
      t.references :recipe_id, null: false, foreign_key: { to_table: :recipes }
      t.references :food_id, null: false, foreign_key: { to_table: :foods }

      t.timestamps
    end
  end
end
