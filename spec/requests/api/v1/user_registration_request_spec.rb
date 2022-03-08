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
    expect(response.status).to eq(200)

    user = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(user).to have_key(:id)
    expect(user[:type]).to eq('user')
    expect(user[:attributes][:email]).to eq("whatever@example.com")
    expect(user[:attributes]).to have_key(:api_key)
    expect(user[:attributes]).to_not have_key(:password)
    expect(user[:attributes]).to_not have_key(:password_confirmation)
    expect(user[:attributes]).to_not have_key(:password_digest)
  end

  describe 'sad paths' do
    it 'returns 400 if email not unique' do
      User.create(email: "whatever@example.com", password: "123pass", password_confirmation: "123pass")
      headers = { 'CONTENT_TYPE' => 'application/json' }
      payload = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
      }

      post '/api/v1/users', headers: headers, params: payload.to_json
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      output = JSON.parse(response.body, symbolize_names: true)

      expect(output).to eq({:error=>{:email=>["has already been taken"]}, :status=>"400 Bad Request"})
    end

    it 'returns 400 if no email' do
      headers = { 'CONTENT_TYPE' => 'application/json' }
      payload = {
        "password": "password",
        "password_confirmation": "password"
      }

      post '/api/v1/users', headers: headers, params: payload.to_json
      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      output = JSON.parse(response.body, symbolize_names: true)

      expect(output).to eq({:error=>{:email=>["can't be blank"]}, :status=>"400 Bad Request"})
    end

    it 'returns 400 if no password' do
      headers = { 'CONTENT_TYPE' => 'application/json' }
      payload = {
        "email": "whatever@example.com",
        "password_confirmation": "password"
      }

      post '/api/v1/users', headers: headers, params: payload.to_json
      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      output = JSON.parse(response.body, symbolize_names: true)

      expect(output).to eq({:error=>{:password=>["can't be blank"]}, :status=>"400 Bad Request"})
    end

    it 'returns 400 if passwords dont match' do
      headers = { 'CONTENT_TYPE' => 'application/json' }
      payload = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "wrong"
      }

      post '/api/v1/users', headers: headers, params: payload.to_json
      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      output = JSON.parse(response.body, symbolize_names: true)

      expect(output).to eq({:error=>{:password_confirmation=>["doesn't match Password"]}, :status=>"400 Bad Request"})
    end
  end


end
