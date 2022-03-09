require 'rails_helper'

RSpec.describe ForecastFacade do
  describe 'class methods' do
    it '::get_forecast(coords)', :vcr do
      location = 'denver,co'
      forecast = ForecastFacade.get_forecast_for(location)

      expect(forecast).to be_a(Forecast)
    end

    it '::get_data', :vcr do
      coords = {:lat=>39.738453, :lng=>-104.984853}
      data = ForecastService.get_forecast_for(coords)

      expect(data).to be_a Hash
      expect(data[:timezone]).to eq('America/Denver')
      expect(data).to have_key(:current)
      expect(data).to have_key(:daily)
      expect(data).to have_key(:hourly)
    end

    it '::get_coords', :vcr do
      location = 'Denver,CO'
      expected = {:lat=>39.738453, :lng=>-104.984853}

      expect(ForecastFacade.get_coords(location)).to eq(expected)
    end
  end
end
