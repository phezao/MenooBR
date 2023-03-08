# frozen_string_literal: true

module V1
  class RecipesController < ApplicationController
    before_action :set_recipe, only: %i[show update destroy]
    skip_before_action :verify_authenticity_token
    def index
      pagy, @recipes = pagy(Recipe.all)
      pagy_headers_merge(pagy)
      render json: @recipes
    end

    def create
      recipe_service = CreateRecipe.new(recipe_params)
      if recipe_service.save
        render json: recipe_service.recipe, status: :created
      else
        render json: recipe_service.errors, status: :unprocessable_entity
      end
    end

    def show
      render json: @recipe, include: :ingredients
    end

    def update
      if @recipe.update(recipe_params)
        render json: @recipe, include: :ingredients
      else
        render json: @recipe.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @recipe.destroy
      render json: @recipe
    end

    def import
      ImportRecipesJob.perform_async
      render json: { 'result': 'Recipes imported from Spoonacular!' }, status: :ok
    end

    private

    def recipe_params
      params.permit(
        :title, :notes, ingredients_attributes: %i[name]
      )
    end

    def set_recipe
      @recipe = Recipe.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: e
    end
  end
end
