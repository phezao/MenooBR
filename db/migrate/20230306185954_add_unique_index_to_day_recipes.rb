class AddUniqueIndexToDayRecipes < ActiveRecord::Migration[6.1]
  def change
    add_index :day_recipes, [:day_id, :recipe_id], unique: true
  end
end
