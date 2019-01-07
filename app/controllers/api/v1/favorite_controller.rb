class Api::V1::FavoriteController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    favorite = Favorite.create(user_id: user.id, location: params[:location])
  end
end
