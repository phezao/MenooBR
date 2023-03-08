class DayRecipe < ApplicationRecord
  belongs_to :day
  belongs_to :recipe
  enum meal_type: { lunch: 0, dinner: 1 }
end
