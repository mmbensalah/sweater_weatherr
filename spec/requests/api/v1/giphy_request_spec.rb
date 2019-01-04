require 'rails_helper'

describe 'GET /api/v1/gifs?location=denver,co' do
  it 'returns time, summary, gif url' do
    location = 'Denver, CO'

    get "/api/v1/gifs?location=#{location}"

    expect(response).to be_successful
    parsed_response = JSON.parse(response.body)

    expect(parsed_response).to have_key(:data)
    expect(parsed_response[:data][:daily_forecasts][0][url]).to eq("/") 
  end
end
