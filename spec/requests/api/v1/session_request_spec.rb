require 'rails_helper'

describe 'POST /api/v1/sessions' do
  it 'creates new user session for created user' do
    user = User.create(email: 'email@gmail.com', password: '12345', password_confirmation: '12345', api_key: 'abc123')

    data = {email: user.email,
            password: user.password
            }

    post "/api/v1/sessions", params: data

    expect(response.status).to eq(200)
    parsed_response = JSON.parse(response.body)
    key = parsed_response["data"]["attributes"]["api_key"]
    expect(key).to eq(User.last.api_key)
  end
end
