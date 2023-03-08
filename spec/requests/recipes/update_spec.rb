# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
describe 'PUT/PATCH /v1/recipes/:id', type: :request do
  let(:params) do
    { title: 'Baked potato with butter' }
  end
  context 'when sending a valid id' do
    let(:recipe) { create(:recipe) }
    context 'and sending valid params' do
      it 'updates the record' do
        patch "/v1/recipes/#{recipe.id}", params: params
        recipe.reload
        expect(recipe.title).to eq(params[:title])
      end
      it 'returns the updated record' do
        patch "/v1/recipes/#{recipe.id}", params: params
        recipe.reload
        expect(json).to eq(recipe.as_json.merge({ 'ingredients' => recipe.ingredients.as_json }))
      end
    end
    context 'and sending invalid params' do
      let(:invalid_params) do
        { title: '' }
      end
      it 'returns an error message' do
        patch "/v1/recipes/#{recipe.id}", params: invalid_params
        expect(json['title'].first).to eq("can't be blank")
      end
    end
  end
  context 'when sending an invalid id' do
    it 'returns an error message' do
      patch '/v1/recipes/101', params: params
      expect(json).to eq("Couldn't find Recipe with 'id'=101")
    end
  end
end
