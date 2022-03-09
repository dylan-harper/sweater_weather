require 'rails_helper'

RSpec.describe Directions do
  before :each do
    @origin = 'Denver,CO'
    @destination = 'Pueblo,CO'
    @directions_data = DirectionsService.find_route_between(@origin, @destination)
    @dest_lat_long = CoordinateService.get_city_coordinates(@destination)[:locations][0][:latLng]
    @forecast = ForecastService.get_forecast_for(@dest_lat_long)
    @weather_at_eta = WeatherAtX.new(@directions_data, @forecast)
    @directions = Directions.new(@origin, @destination, @directions_data, @weather_at_eta)
  end

  it 'exists', :vcr do
    expect(@directions).to be_a Directions
  end

  it 'has attributes', :vcr do
    expect(@directions.id).to eq(nil)
    expect(@directions.start_city).to eq(@origin)
    expect(@directions.end_city).to eq(@destination)
    expect(@directions.travel_time).to be_a String
    expect(@directions.weather_at_eta).to be_a Hash
  end

  describe 'instance methods', :vcr do
    it '#format_time' do
      expected = "01 hour(s), 45 minutes, 01 seconds"

      expect(@directions.format_time(@directions_data)).to eq(expected)
    end
  end

end
