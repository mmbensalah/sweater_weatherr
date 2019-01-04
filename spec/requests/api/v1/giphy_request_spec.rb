require 'rails_helper'

describe 'GET /api/v1/gifs?location=denver,co' do
  it 'returns time, summary, gif url' do
    VCR.use_cassette('GifRequest') do
      location = 'Denver, CO'

      get "/api/v1/gifs?location=#{location}"

      expect(response).to be_successful
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to have_key("data")
      expect(parsed_response["data"][0]["attributes"]["url"]).to eq("https://giphy.com/gifs/pretty-sky-gorgeous-alEGxmahCCywE")
    end
  end
end
