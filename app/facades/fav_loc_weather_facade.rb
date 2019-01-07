class FavLocWeatherFacade
  def initialize(location)
    @location = location
  end

  def fav_weather
    WeatherFacade.new(@location).weather_data
    binding.pry
  end
end
