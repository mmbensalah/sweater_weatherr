require 'rails_helper'

describe 'Weather Facade' do
  it 'exists' do
    location = 'Denver, CO'
    facade = WeatherFacade.new(location)

    expect(facade).to be_an_instance_of(WeatherFacade)
  end

  it 'returns weather data' do
    VCR.use_cassette'WeatherFacade' do
      location = 'Denver, CO'
      weather = WeatherFacade.new(location).weather_data

      expect(weather).to be_an_instance_of(CurrentWeather)
      expect(weather.current_summary).to eq("Clear")
      expect(weather.current_temp).to eq(53.27)
    end
  end
end
