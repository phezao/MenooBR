# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
describe 'POST /v1/recipes', type: :request do
  context 'when sending valid params with ingredient attributes' do
    let(:params) do
      {
        title: 'Pão com ovo',
        notes: 'Pão francês é mais gostoso',
        ingredients_attributes: [{ name: 'Pão' }, { name: 'Ovo' }]
      }
    end

    context 'when the recipe already exists' do
      it "doesn't create the recipe" do
        create(:recipe, params)
        post '/v1/recipes', params: params
        expect { post '/v1/recipes', params: params }.to change { Recipe.count }.by(0)
      end
    end

    context "when ingredient doesn't exist" do
      it 'creates new ingredients as well' do
        expect { post '/v1/recipes', params: params }.to change { Ingredient.count }.by(2)
      end
    end

    context 'when ingredient already exists' do
      it "doesn't create the ingredients" do
        params[:ingredients_attributes].each do |ingredient_attribute|
          create(:ingredient, ingredient_attribute)
        end
        expect { post '/v1/recipes', params: params }.to change { Ingredient.count }.by(0)
      end

      it 'creates the new recipe only' do
        params[:ingredients_attributes].each do |ingredient_attribute|
          create(:ingredient, ingredient_attribute)
        end
        expect { post '/v1/recipes', params: params }.to change { Recipe.count }.by(1)
      end
    end

    it 'returns a JSON containing the new recipe and ingredients' do
      post '/v1/recipes', params: params
      expect(json.deep_symbolize_keys[:title]).to eq(params[:title])
    end

    it 'responds with status code 201' do
      post '/v1/recipes', params: params
      expect(response).to have_http_status(:created)
    end

    it 'creates a new recipe' do
      expect { post '/v1/recipes', params: params }.to change { Recipe.count }.by(1)
    end
  end

  context 'when sending invalid/missing params' do
    let(:invalid_params) do
      { notes: 'test' }
    end
    it "doesn't create a recipe" do
      expect { post '/v1/recipes', params: invalid_params }.not_to(change { Recipe.count })
    end
    it 'returns error message from the recipe' do
      post '/v1/recipes', params: invalid_params
      expect(json.deep_symbolize_keys[:title].first).to eq("can't be blank")
    end
    it 'responds with status code 422' do
      post '/v1/recipes', params: invalid_params
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
