class CreateDayRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :day_recipes do |t|
      t.references :day, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.integer :meal_type

      t.timestamps
    end
  end
end
