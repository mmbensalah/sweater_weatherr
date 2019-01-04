class Api::V1::WeatherController < ApplicationController
  def index
    weather = WeatherFacade.new(params[:location]).weather_data
    render json: WeatherSerializer.new(weather)
  end
end
