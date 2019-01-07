require 'rails_helper'

describe 'POST /api/v1/favorites' do
  it 'creates a favorite location object for user' do
    user = User.create(email: 'email@gmail.com', password: '12345', password_confirmation: '12345', api_key: 'abc123')
    location = 'Denver, CO'

    data = {location: location,
            api_key:  user.api_key
           }

    post "/api/v1/favorites", params: data

    expect(Favorite.last.user_id).to eq(user.id)
  end

  it 'does not create a favorite location for user without api key' do
    user = User.create(email: 'email@gmail.com', password: '12345', password_confirmation: '12345', api_key: 'abc123')
    location = 'Denver, CO'

    data = {location: location
           }

    post "/api/v1/favorites", params: data

    expect(response.status).to eq(401)
    expect(Favorite.last).to eq(nil)
  end

  it 'retrieves a users favorite locations with their api key' do
    user = User.create(email: 'email@gmail.com', password: '12345', password_confirmation: '12345', api_key: 'abc123')
    location   = 'Denver, CO'
    location_1 = 'Golden, CO'

    fav   = user.favorites.create(location: location)
    fav_1 = user.favorites.create(location: location_1)

    params = { api_key: user.api_key }

    get "/api/v1/favorites?api_key=#{user.api_key}"

    expect(response.status).to eq(200)

    parsed_response = JSON.parse(response.body)

    expect(parsed_response["data"][0]["id"]).to eq("Denver, CO")
    expect(parsed_response["data"][1]["id"]).to eq("Golden, CO")
  end

  it 'does not retrieves a users favorite locations without their api key' do
    user = User.create(email: 'email@gmail.com', password: '12345', password_confirmation: '12345', api_key: 'abc123')
    location   = 'Denver, CO'
    location_1 = 'Golden, CO'

    fav   = user.favorites.create(location: location)
    fav_1 = user.favorites.create(location: location_1)

    get "/api/v1/favorites"

    expect(response.status).to eq(401)
    expect(response.body).to eq('')
  end
end
