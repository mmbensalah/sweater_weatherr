class Api::V1::GifController < ApplicationController
  def index
    # gifs = WeatherFacade.new(params[:location]).gif_objects
    # render json: GiphySerializer.new(gifs)
    binding.pry
    WeatherFacade.new(params[:location]).gif_objects
  end
end
