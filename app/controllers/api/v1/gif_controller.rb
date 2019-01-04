class Api::V1::GifController < ApplicationController
  def index
    # gifs = WeatherFacade.new(params[:location]).gif_objects
    # render json: GiphySerializer.new(gifs)
    weather = GiphyFacade.new(params[:location]).gif_data

    render json: GiphySerializer.new(weather)
    # WeatherFacade.new(params[:location]).weather_data
  end
end
