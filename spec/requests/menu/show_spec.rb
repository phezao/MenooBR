require 'rails_helper'

describe 'GET /v1/menu/:id', type: :request do
  before :each do
    create_list(:recipe, 10)
  end
  let(:menu) { create(:menu) }
  it 'returns the menu with all the recipes for each day' do
    get "/v1/menu/#{menu.id}"

    expect(json['days'].size).to eq 5
  end
end
