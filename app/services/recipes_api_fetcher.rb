module RecipesApiFetcher
  def self.call
    response = fetch_data
    parse_response(response)
  end

  def self.fetch_data
    uri = URI("https://api.spoonacular.com/recipes/random?apiKey=#{Rails.application.credentials.spoonacular_api_key}&number=100")
    Net::HTTP.get(uri)
  end

  def self.parse_response(response)
    JSON.parse(response)
  end
end
