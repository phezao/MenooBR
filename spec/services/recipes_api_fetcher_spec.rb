require 'rails_helper'

describe RecipesApiFetcher do
  describe '.call' do
    it 'returns a JSON response with recipes from spoonacular' do
      VCR.use_cassette('recipes_api_fetcher') do
        json_response = RecipesApiFetcher.call
        expect(json_response['recipes'].size).to eq(100)
      end
    end
  end
end
