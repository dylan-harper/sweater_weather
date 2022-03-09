require 'rails_helper'

RSpec.describe HourlyWeather do
  before :each do
    coords = {:lat=>39.738453, :lng=>-104.984853}
    @data = ForecastService.get_forecast_for(coords)[:hourly]
    @hourly_weather = HourlyWeather.new(@data)
  end

  it 'exists', :vcr do
    expect(@hourly_weather).to be_a HourlyWeather
  end

  it 'has attributes', :vcr do
    data = @hourly_weather.data

    data.each do |datum|
      expect(datum).to have_key(:dt)
      expect(datum).to have_key(:temp)
      expect(datum).to have_key(:conditions)
      expect(datum).to have_key(:icon)
    end
  end
end
