class ForecastFacade

  def self.get_forecast_for(location)
    coords = get_coords(location)
    all_data = get_data(coords)

    current_weather = CurrentWeather.new(all_data[:current])
    daily_weather = DailyWeather.new(all_data[:daily])
    hourly_weather = HourlyWeather.new(all_data[:hourly])

    Forecast.new(current_weather, daily_weather, hourly_weather)
  end

  def self.get_data(coords)
    ForecastService.get_forecast_for(coords)
  end

  def self.get_coords(location)
    CoordinateService.get_city_coordinates(location)[:locations][0][:latLng]
  end
end
