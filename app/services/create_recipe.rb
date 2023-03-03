class CreateRecipe
  include ActiveModel::Validations

  def initialize(recipe_params)
    @recipe_params = recipe_params
  end

  attr_reader :recipe_params, :recipe

  def save
    @recipe = build_recipe
    ingredients && recipe.ingredients = ingredients
    recipe.valid? ? recipe.save : add_errors(recipe) && false
  end

  private

  def ingredients
    recipe_params[:ingredients_attributes]&.map do |ingredient_attribute|
      Ingredient.find_or_create_by(ingredient_attribute)
    end
  end

  def build_recipe
    Recipe.new(title: recipe_params[:title], notes: recipe_params[:notes])
  end

  def add_errors(object)
    object.errors.each do |error|
      errors.add(error.attribute, error.message)
    end
  end
end
