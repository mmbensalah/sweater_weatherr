class FavLocWeatherSerializer
  include FastJsonapi::ObjectSerializer
  set_id :location
  attributes :location, :current_weather
end
