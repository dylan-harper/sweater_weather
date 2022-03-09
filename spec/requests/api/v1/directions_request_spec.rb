require 'rails_helper'

RSpec.describe 'Directions Request' do
  before :each do
    User.create(email: "test.com", password: "password", password_confirmation: "password")
    @headers = { 'CONTENT_TYPE' => 'application/json' }
    payload = {
      "email": "test.com",
      "password": "password"
    }

    post '/api/v1/sessions', headers: @headers, params: payload.to_json
    @user = JSON.parse(response.body, symbolize_names: true)[:data]
    @api_key = @user[:attributes][:api_key]
  end

  describe 'happy path testing' do
    it 'can retrive directions and weather', :vcr do
      payload = {
        "origin": "Denver,CO",
        "destination": "Pueblo,CO",
        "api_key": @api_key
      }
      post '/api/v1/road_trip', headers: @headers, params: payload.to_json
      expect(response).to be_successful

      roadtrip = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(roadtrip[:type]).to eq('roadtrip')
      expect(roadtrip[:attributes][:start_city]).to eq(payload[:origin])
      expect(roadtrip[:attributes][:end_city]).to eq(payload[:destination])
      expect(roadtrip[:attributes][:travel_time]).to be_a String
      expect(roadtrip[:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(roadtrip[:attributes][:weather_at_eta]).to have_key(:conditions)
    end

    it 'can return data for current weather from small trip', :vcr do
      payload = {
        "origin": "Denver,CO",
        "destination": "Arvada,CO",
        "api_key": @api_key
      }
      post '/api/v1/road_trip', headers: @headers, params: payload.to_json
      expect(response).to be_successful

      output = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(output[:attributes][:travel_time]).to include("00 hour(s)")
    end
  end


 describe 'sad path testing' do
   it 'returns an error for a bad api key', :vcr do
     payload = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": 'xyz'
     }
     post '/api/v1/road_trip', headers: @headers, params: payload.to_json
     expect(response).to_not be_successful
     expect(response.status).to eq(401)

     output = JSON.parse(response.body, symbolize_names: true)
     expect(output[:error]).to eq('Invalid key')
     expect(output[:status]).to eq('401 Unauthorized')
   end

   it 'returns an error for a bad request', :vcr do
     payload = {
      "origin": "Denver,CO",
      "destination": "London,UK",
      "api_key": @api_key
     }
     post '/api/v1/road_trip', headers: @headers, params: payload.to_json
     expect(response).to_not be_successful
     expect(response.status).to eq(400)

     output = JSON.parse(response.body, symbolize_names: true)
     expect(output[:error]).to eq('impossible')
     expect(output[:status]).to eq('400')
   end
 end

end
