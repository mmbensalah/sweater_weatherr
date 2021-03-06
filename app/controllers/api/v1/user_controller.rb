class Api::V1::UserController < ActionController::API

  def create
    user = User.create(user_params)
    saved = user.save!
    if saved
      user.update(api_key: user.create_api_key)
    end
    render json: UserSerializer.new(user), status: 201
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :api_key)
  end
end
