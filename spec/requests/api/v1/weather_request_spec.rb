require 'rails_helper'

describe 'GET /weather' do
  it 'gets weather for location' do
    location = 'denver,co'

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful
  end
end
