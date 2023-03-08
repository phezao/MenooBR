require 'rails_helper'

describe 'GET /v1/menu/:id/shopping_list', type: :request do
  it 'returns the ingredients for all the recipes' do
    create_list(:recipe, 10)
    get '/v1/menu/generate'

    expect(json['days'].size).to eq 5
  end
end
