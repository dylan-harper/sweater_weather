require 'rails_helper'

RSpec.describe CurrentWeather do
  before :each do
    coords = {:lat=>39.738453, :lng=>-104.984853}
    @data = ForecastService.get_forecast_for(coords)[:current]
    @current_weather = CurrentWeather.new(@data)
  end

  it 'exists', :vcr do
    expect(@current_weather).to be_a CurrentWeather
  end

  it 'has attributes', :vcr do
    data = @current_weather.data
    expect(data).to be_a Hash
    expect(data).to have_key(:dt)
    expect(data).to have_key(:sunrise)
    expect(data).to have_key(:sunset)
    expect(data).to have_key(:temp)
    expect(data).to have_key(:humidity)
    expect(data).to have_key(:uvi)
    expect(data).to have_key(:visibility)
    expect(data).to have_key(:conditions)
    expect(data).to have_key(:icon)
  end
end
