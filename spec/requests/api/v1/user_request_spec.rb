require 'rails_helper'

describe 'POST /users' do
  it 'creates user and returns their api key' do
    data = {email: 'email@gmail.com',
            password: '12345',
            password_confirmation: '12345'
            }

    post "/api/v1/users", params: data

    expect(response.status).to eq(201)
    parsed_response = JSON.parse(response.body)
    key = parsed_response["data"]["attributes"]["api_key"]
    expect(key).to eq(User.last.api_key)
  end
end
