# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Recipes', type: :request do
  describe 'POST /v1/recipes' do
    context 'when sending valid params with ingredient attributes' do
      let(:params) do
        {
          title: 'Pão com ovo',
          notes: 'Pão francês é mais gostoso',
          ingredients_attributes: [{ name: 'Pão' }, { name: 'Ovo' }]
        }
      end
      it 'creates a new recipe' do
        expect { post '/v1/recipes', params: params }.to change { Recipe.count }.by(1)
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
  describe 'GET /v1/recipes' do
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
  describe 'GET /v1/recipes/:id' do
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
  describe 'PUT/PATCH /v1/recipes/:id' do
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
  describe 'DELETE /v1/recipes/:id' do
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
  describe 'GET /v1/recipes/import' do
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
end
