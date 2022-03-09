class DirectionsFacade

  def self.get_directions_between(origin, destination)
    directions = DirectionsService.find_route_between(origin, destination)
    return nil if directions[:info][:statuscode] == 402
    dest_lat_long = CoordinateService.get_city_coordinates(destination)[:locations][0][:latLng]
    forecast_at_dest = ForecastService.get_forecast_for(dest_lat_long)
    Directions.new(origin, destination, directions, forecast_at_dest)
  end

end
