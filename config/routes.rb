Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'weather#index'
      post '/users',   to: 'user#create'
      get '/gifs',     to: 'gif#index'
    end
  end
end
