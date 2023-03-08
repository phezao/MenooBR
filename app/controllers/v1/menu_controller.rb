# frozen_string_literal: true

module V1
  class MenuController < ApplicationController
    def index
      @menus = Menu.all

      render json: @menus
    end

    def show
      @menu = Menu.find(params[:id])

      render json: ::MenuSerializer.new(@menu)
    end

    def shopping_list
      menu = Menu.find(params[:id])
      ingredients = GenerateShoppingList.new(menu).call

      render json: ingredients
    end

    def generate
      menu = CreateMenu.new.call

      render json: menu, include: :days
    end
  end
end
