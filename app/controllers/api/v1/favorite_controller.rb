class Api::V1::FavoriteController < ApplicationController
  # before_action :authenticate
  def create
    if params[:api_key]
      Favorite.create(user_id: user.id, location: params[:location])
      render json: { message: 'Favorite Location Created' }, status: 200
    else
      invalid_credentials
    end
  end

  def index
    if params[:api_key]
      favorites = Favorite.where(user_id: user.id) #user.favorites
      render json: WeatherSerializer.new(favorite_weather(favorites))
    else
      invalid_credentials
    end
  end

  def destroy
    favorite = Favorite.find_by(location: params[:location])
    favorite.destroy
    favorites = Favorite.where(user_id: user.id)
    render json: WeatherSerializer.new(favorite_weather(favorites))
  end

  private

  def user
    User.find_by(api_key: params[:api_key])
  end

  def favorite_weather(favorites)
    favorites.map do |f|
      WeatherFacade.new(f.location).weather_data
    end
  end
end
