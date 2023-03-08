# frozen_string_literal: true

class GenerateShoppingList
  def initialize(menu)
    self.menu = menu
    self.ingredients = {}
  end

  def call
    recipes = menu.recipes
    ingredients_array = recipes.map(&:ingredients).flatten
    ingredients_array.each do |i|
      add_ingredient(i)
    end
    ingredients
  end

  private

  def add_ingredient(igr)
    ingredients[igr.name].blank? ? ingredients[igr.name] = 1 : ingredients[igr.name] += 1
  end

  attr_accessor :menu, :ingredients
end
