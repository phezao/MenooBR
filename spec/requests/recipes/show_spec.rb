# frozen_string_literal: true

require 'rails_helper'

describe 'GET /v1/recipes/:id', type: :request do
  context 'when you send a valid id' do
    let(:recipe) { create(:recipe) }
    it 'returns a JSON with recipe' do
      get "/v1/recipes/#{recipe.id}"
      expect(json).to eq(recipe.as_json.merge({ 'ingredients' => recipe.ingredients.as_json }))
    end
    it 'returns the ingredients associated' do
      get "/v1/recipes/#{recipe.id}"
      expect(json['ingredients']).to eq(recipe.ingredients.as_json)
    end
  end
  context 'when you send an invalid id' do
    it 'returns error message' do
      get '/v1/recipes/101'
      expect(json).to eq("Couldn't find Recipe with 'id'=101")
    end
  end
end
