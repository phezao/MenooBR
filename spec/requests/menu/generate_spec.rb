require 'rails_helper'

describe 'GET /v1/menu/generate', type: :request do
  it 'returns the recipes for the week' do
    create_list(:recipe, 10)
    get '/v1/menu/generate'

    expect(json['days'].size).to eq 5
  end
end
