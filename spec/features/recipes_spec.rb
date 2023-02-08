require 'rails_helper'

RSpec.feature 'Recipes', type: :feature do
  scenario 'Add a recipe' do
    visit root_path

    recipe_name = 'Tteokbokki com queijo gratinado e arroz'

    click_on 'new-recipe'
    fill_in 'recipe-title', with: recipe_name
    fill_in 'recipe-notes', with: 'Não pode utilizar mel no preparo pois ele altera o sabor da comida'
    fill_in(class: 'ingredient-1', with: 'Tteok')
    click_on 'add-ingredient'
    fill_in 'ingredient-2', with: 'Gochujang'
    click_on 'add-ingredient'
    fill_in 'ingredient-3', with: 'Melado de cana'

    click_on 'submit-recipe'
    expect(page).to include(recipe_name)
  end
end
