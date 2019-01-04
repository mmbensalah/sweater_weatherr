require 'rails_helper'

describe 'POST /users' do
  it 'creates user and returns their api key' do
    data = {email: 'email@gmail.com',
            password: '12345',
            password_confirmation: '12345'
            }

    post "/api/v1/users", params: {user: data}
binding.pry
    expect(response).to eq(201)

  end
end
