require 'rails_helper'

describe 'POST /api/v1/favorites' do
  it 'creates a favorite location for user' do
    user = User.create(email: 'email@gmail.com', password: '12345', password_confirmation: '12345', api_key: 'abc123')
    location = 'Denver, CO'

    data = {location: location,
            api_key:  user.api_key
           }

    post "/api/v1/favorites", params: data

    expect(Favorite.last.user_id).to eq(user.id)
  end
end
