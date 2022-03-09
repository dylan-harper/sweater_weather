require 'rails_helper'

RSpec.describe DirectionsFacade do

  it 'exists' do
    expect(DirectionsFacade.new).to be_a DirectionsFacade
  end

  describe 'class methods' do
    it '::get_directions_between(origin, destination)', :vcr do
      origin = "Denver,CO"
      destination = "Pueblo,CO"
      result = DirectionsFacade.get_directions_between(origin, destination)

      expect(result).to be_a Directions
    end

    it '::get_coords', :vcr do
      destination = 'Denver,CO'
      expect(DirectionsFacade.get_coords(destination)).to eq({:lat=>39.738453, :lng=>-104.984853})
    end

    it '::get_forecast_for', :vcr do
      coords = {:lat=>39.738453, :lng=>-104.984853}
      forecast = DirectionsFacade.get_forecast_for(coords)

      expect(forecast).to be_a Hash
      expect(forecast[:timezone]).to eq('America/Denver')
    end

    it '::weather_at_eta', :vcr do
      origin = 'Denver,CO'
      destination = 'Pueblo,CO'
      coords = CoordinateService.get_city_coordinates(destination)[:locations][0][:latLng]
      forecast = DirectionsFacade.get_forecast_for(coords)
      directions = DirectionsService.find_route_between(origin, destination)

      expect(DirectionsFacade.weather_at_eta(directions, forecast)).to be_a WeatherAtX
    end

    it '::service', :vcr do
      origin = 'Denver,CO'
      destination = 'Pueblo, CO'
      service = DirectionsFacade.service(origin, destination)

      expect(service).to be_a Hash
      expect(service[:route][:legs][0][:destNarrative]).to include(destination.upcase)
    end
  end
end
