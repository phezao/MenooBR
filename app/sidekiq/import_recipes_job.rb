class ImportRecipesJob
  include Sidekiq::Job
  queue_as :default

  def perform
    json_recipes = RecipesApiFetcher.call
    json_recipes['recipes'].each do |json_recipe|
      recipe = RecipeResponseMapper.new(json_recipe).call
      CreateRecipe.new(recipe).save
    end
  end
end
