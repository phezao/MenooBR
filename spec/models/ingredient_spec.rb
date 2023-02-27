require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  it { is_expected.to have_many(:recipes) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
end
