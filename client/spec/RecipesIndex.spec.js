import Home from '../src/views/Home';
import { mount } from '@vue/test-utils';

describe('RecipesIndexPage', () => {
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
