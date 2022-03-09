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

 it 'can retrive directions and weather' do
   payload = {
    "origin": "Denver,CO",
    "destination": "Austin,TX",
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

end
