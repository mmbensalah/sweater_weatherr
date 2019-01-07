class Api::V1::FavoriteController < ApplicationController
  def create
    if params[:api_key]
      user = User.find_by(api_key: params[:api_key])
      Favorite.create(user_id: user.id, location: params[:location])
    else
      render body: nil, status: :unauthorized
    end
  end
end
