class DirectionsFacade

  def self.get_directions_between(origin, destination)
    directions = service(origin, destination)
    
    return nil if directions[:info][:statuscode] == 402

    dest_lat_long = get_coords(destination)
    forecast_at_dest = get_forecast_for(dest_lat_long)
    weather_at_dest = weather_at_eta(directions, forecast_at_dest)

    Directions.new(origin, destination, directions, weather_at_dest)
  end

  def self.get_coords(destination)
    CoordinateService.get_city_coordinates(destination)[:locations][0][:latLng]
  end

  def self.get_forecast_for(dest_lat_long)
    ForecastService.get_forecast_for(dest_lat_long)
  end

  def self.weather_at_eta(directions, forecast_at_dest)
    WeatherAtX.new(directions, forecast_at_dest)
  end

  def self.service(origin, destination)
    DirectionsService.find_route_between(origin, destination)
  end

end
