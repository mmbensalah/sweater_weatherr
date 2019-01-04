class Api::V1::GifController < ApplicationController
  def index
    render json: WeatherFacade.new(params[:location]).get_gifs
  end
end
