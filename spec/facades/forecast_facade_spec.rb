require 'rails_helper'

RSpec.describe ForecastFacade do
  describe 'class methods' do
    describe '::get_forecast(coords)' do

      it 'outputs a poro', :vcr do
        @location = 'denver,co'
        @forecast = ForecastFacade.get_forecast_for(@location)

        expect(@forecast).to be_a(Forecast)
      end
    end

    it '::service' do
      expect(ForecastFacade.service).to be_a ForecastService
    end
  end
end
