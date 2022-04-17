@RecipesIndexPage
Feature: List all the recipes for the user
  Scenario: the user is logged in and in the recipes index page
    User has authenticated token
    Import the RecipesIndexPage

    Given the user just got to the page
    And has a list of recipes

      mount the RecipesIndexPage
      create list of recipesList array
      API endpoint of the recipesList

     When he looks at the page

      load the RecipesIndexPage
      GET request to the API endpoint of the rails app

     Then he sees all his recipes each one in a RecipeCard

      expect to have a RecipeCard showing with the details of the first recipe
      expect to have X number of RecipeCards
      expect the API to return JSON of recipes available from that user

    Given the user just got to the page
    And has no recipes

      mount the RecipesIndexPage
      API endpoint of the recipesList

     When he looks at the page

      load the RecipesIndexPage
      GET request to the API endpoint of the rails app

     Then he sees a div with an empty state and a call to action

      expect the API to return an empty JSON
      expect the page to have an empty state saying "You don't have recipes yet! Add one"


    Given the user is in the recipes index page
    And has a list of recipes
    And wants to seach for a recipe

      mount the RecipesIndexPage
      create list of recipesList array
      API endpoint of the recipesList
      GET request to the API endpoint of the rails app


     When he starts filling the Searchbox with a recipe name

      GET request to the API endpoint of the rails app with the query of the recipe filled in the Searchbox

     Then the Searchbox will autocomplete with the recipes available

      expect the Searchbox to have suggestions of the recipes in the recipesList array

     And the list returns only recipes with that query

      expect the API endpoint to return JSON, just the recipes similar to the input in the Searchbox
      expect to have RecipeCard with the title similar to the input seachbox


    Given the user is in the recipes index page
    And has a list of recipes
    And wants to see all recipes with a specific tag

      mount the RecipesIndexPage
      create list of recipesList array
      API endpoint of the recipesList
      GET request to the API endpoint of the rails app

     When he selects some tags

      GET request to the API endpoint of the rails app with the query of the recipes where tag are the ones selecteds

     Then the list returns only recipes with those tags
      expect the API endpoint to return JSON, just the recipes similar to the input in the Searchbox
      expect to have RecipeCard with the tag of the tags input


    Given the user is in the recipes index page
    And has a list of recipes
    And wants to see more details about a recipe

      mount the RecipesIndexPage
      create list of recipesList array
      API endpoint of the recipesList
      GET request to the API endpoint of the rails app

     When he clicks in the 'View' inside the RecipeCard

     Then the goes to the RecipeShow page
      expect to be redirected to the RecipeShow page
