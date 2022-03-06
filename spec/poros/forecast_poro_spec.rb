require 'rails_helper'

RSpec.describe Forecast do
  before :each do
    @location = 'denver,co'
    @forecast = ForecastFacade.get_forecast_for(@location)
  end

  it 'exists' do
    expect(@forecast).to be_a Forecast
  end

  describe 'attributes' do
    it 'has current_weather' do
      current = @forecast.current_weather
      #include
      expect(current).to have_key(:dt)
      expect(current).to have_key(:sunrise)
      expect(current).to have_key(:sunset)
      expect(current).to have_key(:temp)
      expect(current).to have_key(:feels_like)
      expect(current).to have_key(:humidity)
      expect(current).to have_key(:uvi)
      expect(current).to have_key(:visibility)
      expect(current).to have_key(:conditions)
      expect(current).to have_key(:icon)
      #exclude
      expect(current).to_not have_key(:clouds)
      expect(current).to_not have_key(:wind_speed)
      expect(current).to_not have_key(:wind_deg)
      expect(current).to_not have_key(:pressure)
      expect(current).to_not have_key(:wind_gust)
      expect(current).to_not have_key(:snow)
    end

    it 'has daily_weather' do
      daily = @forecast.daily_weather

      daily.each do |day|
        #include
        expect(day).to have_key(:dt)
        expect(day).to have_key(:sunrise)
        expect(day).to have_key(:sunset)
        expect(day).to have_key(:max_temp)
        expect(day).to have_key(:min_temp)
        expect(day).to have_key(:conditions)
        expect(day).to have_key(:icon)
        #exclude
        expect(day).to_not have_key(:pressure)
        expect(day).to_not have_key(:humidity)
        expect(day).to_not have_key(:dew_point)
        expect(day).to_not have_key(:wind_speed)
        expect(day).to_not have_key(:wind_deg)
        expect(day).to_not have_key(:wind_gust)
        expect(day).to_not have_key(:wind_clouds)
        expect(day).to_not have_key(:pop)
        expect(day).to_not have_key(:snow)
        expect(day).to_not have_key(:uvi)
      end
    end
    
    it 'has hourly_weather' do
      hourly = @forecast.hourly_weather

      hourly.each do |hour|
        #include
        expect(hour).to have_key(:dt)
        expect(hour).to have_key(:temp)
        expect(hour).to have_key(:conditions)
        expect(hour).to have_key(:icon)
        #exclude
        expect(hour).to_not have_key(:pressure)
        expect(hour).to_not have_key(:humidity)
        expect(hour).to_not have_key(:uvi)
        expect(hour).to_not have_key(:visibility)
        expect(hour).to_not have_key(:wind_speed)
        expect(hour).to_not have_key(:wind_deg)
        expect(hour).to_not have_key(:wind_gust)
        expect(hour).to_not have_key(:pop)
      end
    end
  end
end
