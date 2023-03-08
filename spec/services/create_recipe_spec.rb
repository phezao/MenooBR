require 'rails_helper'

describe CreateRecipe do
  let(:recipe_params) do
    {
      title: 'Curry com arroz',
      notes: 'Colocar gengibre junto com o alho',
      ingredients_attributes: [
        { name: 'Curry' },
        { name: 'Arroz' },
        { name: 'Gengibre' }
      ]
    }
  end
  describe '#save' do
    context 'when the params are valid' do
      it 'creates a new recipe' do
        expect { described_class.new(recipe_params).save }.to change { Recipe.count }.by(1)
      end
    end
    context 'when the params are invalid' do
      let(:recipe_params) { { notes: 'test' } }
      it "doesn't create new recipe" do
        expect { described_class.new(recipe_params).save }.to change { Recipe.count }.by(0)
      end
    end
  end
end
