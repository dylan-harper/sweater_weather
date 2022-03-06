require 'rails_helper'

RSpec.describe ForecastService do
  describe 'class methods' do
    describe 'get_city_forecast(lat,long)' do
      it 'can get a forecast from coordinates', :vcr do
        city_state = 'denver,co'
        coordinates = CoordinateService.get_city_coordinates(city_state)
        lat_lng = coordinates[:locations][1][:latLng]
        expect(lat_lng[:lat].to_s).to eq("39.738453")
        expect(lat_lng[:lng].to_s).to eq("-104.984853")

        forecast = ForecastService.get_forecast_for(lat_lng)

        expect(forecast).to be_a Hash
        expect(forecast[:lat].to_s).to eq("39.7385")
        expect(forecast[:lon].to_s).to eq("-104.9849")
        expect(forecast[:timezone]).to eq("America/Denver")
        expect(forecast).to have_key(:current)
        expect(forecast[:current]).to have_key(:sunrise)
        expect(forecast[:current]).to have_key(:sunset)
        expect(forecast[:current]).to have_key(:temp)
        expect(forecast[:current]).to have_key(:feels_like)
        expect(forecast[:current]).to have_key(:pressure)
        expect(forecast[:current]).to have_key(:humidity)
        expect(forecast).to have_key(:hourly)
        expect(forecast).to have_key(:minutely)
        expect(forecast).to have_key(:daily)
      end
    end
  end
end
