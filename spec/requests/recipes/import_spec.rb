# frozen_string_literal: true

require 'rails_helper'

describe 'GET /v1/recipes/import', type: :request do
  it 'populates the db with the Spoonacular API' do
    expect do
      VCR.use_cassette('recipes_api_fetcher') do
        get '/v1/recipes/import'
      end
    end.to change(ImportRecipesJob.jobs, :size).by(1)
  end
  it 'returns status 200 and a message' do
    VCR.use_cassette('recipes_api_fetcher') do
      get '/v1/recipes/import'
    end
    expect(json['result']).to eq('Recipes imported from Spoonacular!')
  end
end
