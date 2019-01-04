class WeatherFacade
  attr_reader :location
  def initialize(location)
    @location = location
  end

  def gif_objects
    gif_data.map do |gif|
      Gif.new(gif[:data][0][:url])
    end
  end

  def gif_data #gives giphy api data for gifs based on summary
    daily_summary.map do |summary|
      GiphyService.new.get_gifs(summary)
    end
  end

  def daily_summary #gives daily summary
    weather_data.daily.map do |day|
      day.summary
    end
  end

  def daily_time #gives daily time
    weather_data.daily.map do |day|
      day.time
    end
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
