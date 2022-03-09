require 'rails_helper'

RSpec.describe Directions do
  before :each do
    @origin = 'Denver,CO'
    @destination = 'Pueblo,CO'
    @directions = DirectionsService.find_route_between(@origin, @destination)
    @dest_lat_long = CoordinateService.get_city_coordinates(@destination)[:locations][0][:latLng]
    @forecast = ForecastService.get_forecast_for(@dest_lat_long)
    @directions = Directions.new(@origin, @destination, @directions, @forecast)
  end

  it 'exists', :vcr do
    expect(@directions).to be_a Directions
  end
end
# it 'has attributes' do
#
# end
