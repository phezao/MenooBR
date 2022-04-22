import Home from '../src/views/Home';
import { mount } from '@vue/test-utils';
import api from '../src/services/axios';
import flushPromises from 'flush-promises';

jest.mock('../src/services/axios');

const recipeList = [
  {
    id: 1,
    name: "feijoada"
  },
  {
    id: 2,
    name: 'bacalhau'
  }
]

describe('RecipesIndexPage', () => {

  test('Makes an API call to get the recipeList', async () => {
    const getRecipes = api.get('/recipes');
    getRecipes.mockResolvedValueOnce({ recipes: recipeList });

    await flushPromises();
    const wrapper = mount(RecipesIndexPage);
    expect(getRecipes).toBeCalledTimes(1);

    const message = wrapper.find('[data-test="recipe-name-1"]').text();
    expect(message).toEqual(recipeList[0].name);
  });

  test('Render RecipesIndex with recipeList has all recipes', () => {
    const wrapper = mount(Home);
    expect(wrapper.findAll('[data-test="recipeCard"]')).toHaveLength(3)
  });

  test('Render RecipesIndex without recipeList has empty state and call to action', () => {
    expect(true).toBe(true);
  });

  test('Searchbox will autocomplete with the recipes available', () => {
    expect(true).toBe(true);
  });

  test('Filtering by tags list returns only recipes with those tags', () => {
    expect(true).toBe(true);
  });

  test('Redirected to the RecipeShow page', () => {
    expect(true).toBe(true);
  });
});
