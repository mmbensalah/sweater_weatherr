class Api::V1::FavoriteController < ApplicationController
  def create
    if params[:api_key]
      Favorite.create(user_id: user.id, location: params[:location])
    else
      render body: nil, status: :unauthorized
    end
  end

  def index
    if params[:api_key]
      locations = Favorite.where(user_id: user.id)
      fav_weather_obj = fav_weather(locations)
      render json: FavLocWeatherSerializer.new(fav_weather_obj)
    else
      render body: nil, status: :unauthorized
    end
  end

  private

  def user
    User.find_by(api_key: params[:api_key])
  end

  def fav_weather(favorites)
    favorites.map do |f|
      cw = WeatherFacade.new(f.location).weather_data
           FavWeather.new(f.location, cw)
      end
  end
end
