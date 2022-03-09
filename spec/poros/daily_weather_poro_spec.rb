require 'rails_helper'

RSpec.describe DailyWeather do
  before :each do
    coords = {:lat=>39.738453, :lng=>-104.984853}
    @data = ForecastService.get_forecast_for(coords)[:daily]
    @daily_weather = DailyWeather.new(@data)
  end

  it 'exists', :vcr do
    expect(@daily_weather).to be_a DailyWeather
  end

  it 'has attributes', :vcr do
    data = @daily_weather.data

    expect(data.length).to eq(5)
    data.each do |datum|
      expect(datum).to have_key(:dt)
      expect(datum).to have_key(:sunrise)
      expect(datum).to have_key(:sunset)
      expect(datum).to have_key(:max_temp)
      expect(datum).to have_key(:min_temp)
      expect(datum).to have_key(:conditions)
      expect(datum).to have_key(:icon)
    end
  end

end
