require 'rails_helper'

RSpec.describe DayRecipe, type: :model do
  it { is_expected.to belong_to(:recipe) }
  it { is_expected.to belong_to(:day) }
end
