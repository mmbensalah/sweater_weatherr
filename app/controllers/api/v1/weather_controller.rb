class Api::V1::WeatherController < ApplicationController
  def index
    weather = WeatherFacade.new(params[:location]).weather_data
    render json: WeatherSerializer.new(weather)
    binding.pry
  end
end
# GET /api/v1/forecast?location=denver,co
