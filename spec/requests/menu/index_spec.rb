require 'rails_helper'

describe 'GET /v1/menu', type: :request do
  it 'returns all the menus' do
    create_list(:menu, 10)
    get '/v1/menu'

    expect(json.size).to eq 10
  end
end
