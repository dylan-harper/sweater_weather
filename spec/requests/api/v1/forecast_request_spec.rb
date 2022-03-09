require 'rails_helper'

RSpec.describe 'Forecast Request', type: :request do
  it 'retrieves forecast data for a given city', :vcr do
    get "/api/v1/forecast?location=denver,co"
    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(forecast[:id]).to eq(nil)
    expect(forecast[:type]).to eq('forecast')
    expect(forecast[:attributes]).to have_key(:current_weather)
    expect(forecast[:attributes]).to have_key(:daily_weather)
    expect(forecast[:attributes]).to have_key(:hourly_weather)
    expect(forecast[:attributes][:daily_weather].length).to eq(5)
    expect(forecast[:attributes][:hourly_weather].length).to eq(8)
  end
end
