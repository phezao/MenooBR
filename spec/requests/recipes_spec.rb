# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'POST /v1/recipes' do
    context 'when sending valid params with ingredient attributes' do
      let(:params) do
        { recipe: {
          title: 'Pão com ovo',
          notes: 'Pão francês é mais gostoso',
          ingredients_attributes: [{ name: 'Pão' }, { name: 'Ovo' }]
        } }
      end
      it 'creates a new recipe' do
        expect { post '/v1/recipes', params: params }.to change { Recipe.count }.by(1)
      end
      it 'creates new ingredients as well' do
        expect { post '/v1/recipes', params: params }.to change { Ingredient.count }.by(2)
      end
      it 'returns a JSON containing the new recipe and ingredients' do
        post '/v1/recipes', params: params
        json_response = JSON.parse(response.body).deep_symbolize_keys
        expect(json_response[:title]).to eq(params[:recipe][:title])
      end
      it 'responds with status code 201' do
        post '/v1/recipes', params: params
        expect(response).to have_http_status(:created)
      end
    end

    context 'when sending invalid/missing params' do
      let(:invalid_params) do
        { recipe: {
          notes: 'test'
        } }
      end
      it "doesn't create a recipe" do
        expect { post '/v1/recipes', params: invalid_params }.not_to(change { Recipe.count })
      end
      it 'returns error message from the recipe' do
        post '/v1/recipes', params: invalid_params
        json_response = JSON.parse(response.body).deep_symbolize_keys
        expect(json_response[:title].first).to eq("can't be blank")
      end
      it 'responds with status code 422' do
        post '/v1/recipes', params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
