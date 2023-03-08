require 'rails_helper'

describe GenerateShoppingList do
  describe '#call' do
    let(:menu) { create(:menu) }
    it 'returns the ingredients from the recipes' do
      expect(described_class.new(menu).call.keys).to include(menu.recipes.first.ingredients.first.name)
    end

    subject { described_class.new(menu).call.values }

    it { is_expected.to all(be_a Integer) }
  end
end
