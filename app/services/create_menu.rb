class CreateMenu
  include ActiveModel::Validations

  def call
    menu = Menu.create
    5.times do |i|
      day = Day.create!(menu: menu, weekday: i)
      sample = day.monday? ? Recipe.sample : Recipe.next_sample(DayRecipe.last.recipe)
      2.times { |n| build_day_recipe(day: day, meal_type: n, recipe: sample) }
    end
    menu
  end

  private

  def build_day_recipe(day:, meal_type:, recipe:)
    recipe = Recipe.next_sample(recipe) unless meal_type.zero?
    DayRecipe.create!(day: day, meal_type: meal_type, recipe: recipe)
  end

  def add_errors(object)
    object.errors.each do |error|
      errors.add(error.attribute, error.message)
    end
  end
end
