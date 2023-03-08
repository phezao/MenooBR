require 'rails_helper'

RSpec.describe Day, type: :model do
  it { is_expected.to have_many(:recipes) }
  it { is_expected.to belong_to(:menu) }
  it { is_expected.to validate_presence_of(:weekday) }
end
