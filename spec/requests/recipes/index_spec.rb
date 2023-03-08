# frozen_string_literal: true

require 'rails_helper'

describe 'GET /v1/recipes', type: :request do
  context 'when you have a list of recipes' do
    it 'returns a list of recipes' do
      create_list(:recipe, 5)
      get '/v1/recipes'
      expect(json.size).to eq(5)
    end
  end
  context "when you don't have a list of recipes" do
    it 'returns an empty array' do
      get '/v1/recipes'
      expect(json).to eq([])
    end
  end
end
