require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it { is_expected.to have_many(:ingredients) }
end
