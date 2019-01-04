class WeatherFacade
  attr_reader :location
  def initialize(location)
    @location = location
  end

  def get_gifs
    weather_data
    binding.pry
  end

  def weather_data
    data = DarkSkyService.new(lat,lng).get_weather
    CurrentWeather.new(data)
  end

  def lat
    GeocodeService.new(@location).get_lat
  end

  def lng
    GeocodeService.new(@location).get_lng
  end
end
