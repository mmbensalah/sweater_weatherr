class Api::V1::GifController < ApplicationController
  def index
    render json: WeatherFacade.new(params[:location]).gif_objects
binding.pry
  end
end
