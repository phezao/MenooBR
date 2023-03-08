require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it { is_expected.to have_many(:ingredients) }
  it { is_expected.to accept_nested_attributes_for(:ingredients) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_uniqueness_of(:title).case_insensitive }
end
