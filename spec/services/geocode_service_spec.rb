require 'rails_helper'

describe 'Geocode Service' do
  it 'exists' do
    address = 'address'
    service = GeocodeService.new(address)

    expect(service).to be_an_instance_of(GeocodeService)
  end

  it 'returns lat and long' do
    VCR.use_cassette 'GeocodeLatLong' do
      address = '1331 17th Street, Denver, CO'

      service = GeocodeService.new(address)
      coord = service.get_coord
      lat = coord[:results][0][:geometry][:location][:lat]
      lng = coord[:results][0][:geometry][:location][:lng]

      expect(coord).to have_key(:results)
      expect(lat).to eq(39.7507834)
      expect(lng).to eq(-104.9964355)
    end
  end
end
