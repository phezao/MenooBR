class RecipeResponseMapper
  def initialize(json_response)
    self.title = json_response['title']
    self.ingredients = map_ingredients(json_response['extendedIngredients'])
    self.notes = json_response['sourceUrl']
  end

  attr_reader :title, :ingredients, :notes

  def call
    OpenStruct.new(title: title, notes: notes, ingredients_attributes: ingredients)
  end

  private

  attr_writer :title, :ingredients, :notes

  def map_ingredients(ingredients_array)
    ingredients_array.map do |ingredient|
      { name: ingredient['originalName'] }
    end
  end
end
