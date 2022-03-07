require 'rails_helper'

RSpec.describe ForecastFacade do
  describe 'class methods' do
    describe '::get_forecast_for(location)' do

      it 'outputs a poro', :vcr do
        @location = 'denver,co'
        @forecast = ForecastFacade.get_forecast_for(@location)

        expect(@forecast).to be_a(Forecast)
      end
    end
  end
end
