# frozen_string_literal: true

module V1
  class RecipesController < ApplicationController
    def create
      @recipe = Recipe.new(recipe_params)

      if @recipe.save
        render json: @recipe, status: :created
      else
        render json: @recipe.errors, status: :unprocessable_entity
      end
    end

    private

    def recipe_params
      params.require(:recipe).permit(
        :title, :notes, ingredients_attributes: %i[name]
      )
    end
  end
end
