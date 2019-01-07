Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get  '/forecast',   to: 'weather#index'
      post '/users',      to: 'user#create'
      post '/sessions',   to: 'session#create'
      post '/favorites',  to: 'favorite#create'
      get  '/favorites',  to: 'favorite#index'
    end
  end
end
