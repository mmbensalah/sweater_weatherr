class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def invalid_credentials
    render json: { message: 'Invalid Credentials' }, status: 401
  end
end
