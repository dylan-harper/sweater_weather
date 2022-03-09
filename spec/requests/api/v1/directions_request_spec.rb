require 'rails_helper'

RSpec.describe 'Directions Request' do
  before :each do
    User.create(email: "test.com", password: "password", password_confirmation: "password")
    @headers = { 'CONTENT_TYPE' => 'application/json' }
    payload = {
      "email": "whatever@example.com",
      "password": "password"
    }
    post '/api/v1/users', headers: @headers, params: payload.to_json
    @user = JSON.parse(response.body, symbolize_names: true)[:data]
    @api_key = @user[:attributes][:api_key]
  end

 it 'can retrive directions and weather' do
   payload = {
    "origin": "Denver,CO",
    "destination": "Pueblo,CO",
    "api_key": @api_key
   }
   post '/api/v1/road_trip', headers: @headers, params: payload.to_json

   expect(response).to be_successful
 end

end
