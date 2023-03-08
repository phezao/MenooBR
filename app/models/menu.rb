class Menu < ApplicationRecord
  has_many :days
  has_many :day_recipes, through: :days

  def recipes
    day_recipes.map(&:recipe)
  end
end
