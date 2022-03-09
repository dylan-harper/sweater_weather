class ForecastFacade

  def self.get_forecast_for(location)
    coords = CoordinateService.get_city_coordinates(location)[:locations][0][:latLng]
    data = ForecastService.get_forecast_for(coords)
    Forecast.new(data)
  end

end
