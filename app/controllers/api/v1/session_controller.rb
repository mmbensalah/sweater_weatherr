class Api::V1::SessionController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.password == params[:password]
      render json: UserSerializer.new(user)
    end
  end
end
