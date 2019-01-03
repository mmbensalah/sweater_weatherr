require 'rails_helper'

describe 'Dark Sky API Service' do
  it 'exists' do
    lat = '39.7507834'
    lng = '-104.9964355'
    service = DarkSkyService.new(lat, lng)

    expect(service).to be_an_instance_of(DarkSkyService)
  end

  it 'returns weather for lat and lng' do
    lat = '39.7507834'
    lng = '-104.9964355'
    service = DarkSkyService.new(lat, lng)
    data = service.get_weather
    
    expect(data).to have_key(:latitude)
    expect(data).to have_key(:longitude)
    expect(data).to have_key(:currently)
  end
end
