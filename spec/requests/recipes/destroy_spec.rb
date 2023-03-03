# frozen_string_literal: true

require 'rails_helper'

describe 'DELETE /v1/recipes/:id', type: :request do
  context 'when sending a valid id' do
    let(:recipe1) { create(:recipe) }
    let(:recipe2) { create(:recipe) }
    it 'returns the deleted record' do
      delete "/v1/recipes/#{recipe1.id}"
      expect(json).to eq(recipe1.as_json)
    end
    it 'deletes the record in the db' do
      delete "/v1/recipes/#{recipe1.id}"
      expect(Recipe.all).to eq([recipe2])
    end
  end
  context 'when sending an invalid id' do
    it 'returns an error message' do
      delete '/v1/recipes/101'
      expect(json).to eq("Couldn't find Recipe with 'id'=101")
    end
  end
end
