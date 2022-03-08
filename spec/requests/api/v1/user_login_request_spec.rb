require 'rails_helper'

RSpec.describe 'User Login Request' do

  it 'sends a POST request to login' do
    User.create(email: "whatever@example.com", password: "password", password_confirmation: "password")
    headers = { 'CONTENT_TYPE' => 'application/json' }
    payload = {
      "email": "whatever@example.com",
      "password": "password"
    }
    post '/api/v1/sessions', headers: headers, params: payload.to_json
    expect(response).to be_successful
    expect(response.status).to eq(200)

    user = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(user).to have_key(:id)
    expect(user[:type]).to eq('user')
    expect(user[:attributes][:email]).to eq("whatever@example.com")
    expect(user[:attributes][:api_key]).to be_a String
  end

  describe 'sad path testing' do
    it 'returns 404 for a user DNE' do
      headers = { 'CONTENT_TYPE' => 'application/json' }
      payload = {
        "email": "whatever@example.com",
        "password": "password"
      }
      post '/api/v1/sessions', headers: headers, params: payload.to_json
      expect(response).to_not be_successful
      expect(response.status).to eq(404)

      output = JSON.parse(response.body, symbolize_names: true)
      expect(output[:error]).to eq("User does not exist")
      expect(output[:status]).to eq("404 Not Found")
    end

    it 'returns 400 for bad password' do
      User.create(email: "whatever@example.com", password: "password", password_confirmation: "password")
      headers = { 'CONTENT_TYPE' => 'application/json' }
      payload = {
        "email": "whatever@example.com",
        "password": "nada"
      }
      post '/api/v1/sessions', headers: headers, params: payload.to_json
      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      output = JSON.parse(response.body, symbolize_names: true)

      expect(output[:error]).to eq("Bad credentials")
      expect(output[:status]).to eq("400 Bad Request")
    end
  end
end
