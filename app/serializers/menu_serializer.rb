# frozen_string_literal: true

class MenuSerializer
  def initialize(menu)
    self.menu = menu
  end

  def as_json(*_args)
    {
      id: menu.id,
      created_at: menu.created_at,
      days: days
    }
  end

  private

  def days
    menu.days.map do |day|
      {
        weekday: day.weekday,
        day_recipes: day_recipes(day)
      }
    end
  end

  def day_recipes(day)
    day.day_recipes.map do |day_recipe|
      {
        meal_type: day_recipe.meal_type,
        recipe: recipe(day_recipe.recipe)
      }
    end
  end

  def recipe(recipe)
    {
      id: recipe.id,
      title: recipe.title
    }
  end

  attr_accessor :menu
end
