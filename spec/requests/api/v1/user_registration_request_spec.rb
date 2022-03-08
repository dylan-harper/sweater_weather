require 'rails_helper'

RSpec.describe 'User Registration Request' do

  it 'send a POST request to create a user' do
    headers = { 'CONTENT_TYPE' => 'application/json' }
    payload = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }
    post '/api/v1/users', headers: headers, params: payload.to_json
    expect(response).to be_successful
    expect(response.status).to eq(201)
  end


end
