require 'rails_helper'

describe 'Giphy service' do
  it 'exists' do
    service = GiphyService.new

    expect(service).to be_an_instance_of(GiphyService)
  end

  it 'returns gifs related to a search term' do
    VCR.use_cassette "GiphyAPI" do
      service = GiphyService.new
      q = "hotdogs"
      response = service.get_gifs(q)

      expect(response).to be_an_instance_of(Hash)
      expect(response[:data][0][:url]).to eq("https://giphy.com/gifs/absurdnoise-hotdogs-cute-absurdnoise-unv3VXnKGWxhe")
    end
  end
end
# response[:data] = array
# response[:data].map do |gif|
#   Gif.new(gif)
# end
