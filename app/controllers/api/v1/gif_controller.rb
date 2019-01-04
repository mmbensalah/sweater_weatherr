class Api::V1::GifController < ApplicationController
  def index
    gifs = GiphyFacade.new(params[:location]).gif_objects
    render json: GiphySerializer.new(gifs)
  end
end
