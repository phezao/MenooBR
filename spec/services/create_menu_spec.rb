require 'rails_helper'

describe CreateMenu do
  describe '#call' do
    let!(:recipes) { create_list(:recipe, 10) }
    it 'Creates a new menu' do
      expect { described_class.new.call }.to change { Menu.count }.by(1)
    end
    it 'Creates weekdays for the menu' do
      menu = described_class.new.call
      expect(menu.days.size).to eq(5)
    end
    it 'Assigns recipes for each day' do
      menu = described_class.new.call
      day = menu.days.first
      expect(day.recipes.size).to eq(2)
    end
    it 'Assigns different recipes on a single day' do
      menu = described_class.new.call
      day = menu.days.first
      expect(day.recipes.first).not_to eq(day.recipes.last)
    end
    it 'Assigns different recipes for dinner and lunch on consecutive days' do
      menu = described_class.new.call
      day = menu.days.first
      day_after = menu.days.second
      expect(day.recipes.last).not_to eq(day_after.recipes.first)
    end
  end
end
