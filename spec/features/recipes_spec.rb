require 'rails_helper'

RSpec.feature 'Recipes', type: :feature do
  scenario 'Add the first recipe successfully' do
    visit root_path

    recipe_name = 'Tteokbokki com queijo gratinado e arroz'

    click_on 'new-recipe'
    fill_in 'recipe-title', with: recipe_name
    fill_in 'recipe-notes', with: 'Não pode utilizar mel no preparo pois ele altera o sabor da comida'
    click_on 'add-new-ingredient'
    fill_in 'ingredient-name', with: 'Tteok'
    click_on 'add-more-ingredients'
    fill_in 'ingredient-2', with: 'Gochujang'
    click_on 'add-ingredient'
    click_on 'submit-recipe'
    expect(page).to have_text(recipe_name)
  end

  scenario 'Add another recipe successfully' do
    create(:ingredient, name: 'Arroz')
    create(:ingredient, name: 'Polenta')
    visit root_path

    recipe_name = 'Arroz, polenta e frango grelhado'

    click_on 'new-recipe'
    fill_in 'recipe-title', with: recipe_name
    select 'Arroz', from: 'ingredients-box'
    select 'Polenta', from: 'ingredients-box'
    click_on 'add-new-ingredient'
    fill_in 'ingredient-name', with: 'Frango'
    click_on 'add-ingredient'
    click_on 'submit-recipe'
    expect(page).to have_text(recipe_name)
  end
end
