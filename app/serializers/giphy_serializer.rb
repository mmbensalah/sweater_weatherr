class GiphySerializer
  include FastJsonapi::ObjectSerializer
  attributes :daily_forecasts

  def daily_forecasts
    WeatherFacade.new(object.location).gif_objects
  end
end
