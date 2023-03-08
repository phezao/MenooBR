require 'rails_helper'

describe RecipeResponseMapper do
  describe '#call' do
    let(:recipe_params) do
      {
        'title': 'Lasagna',
        'sourceUrl': 'https://somerecipewebsite.com',
        'extendedIngredients': [
          { 'originalName': 'Mozzarella cheese' },
          { 'originalName': 'Tomato sauce' },
          { 'originalName': 'Basil' }
        ]
      }.as_json
    end
    it 'returns an object with Recipe attributes' do
      recipe_mapper = described_class.new(recipe_params).call
      expect(recipe_mapper.title).to eq(recipe_params['title'])
      expect(recipe_mapper.notes).to eq(recipe_params['sourceUrl'])
    end
  end
end
