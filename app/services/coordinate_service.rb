class CoordinateService

  def self.get_city_coordinates(city_state)
    response = Faraday.get("http://www.mapquestapi.com/geocoding/v1/address?key=#{ENV['GEOCODE_KEY']}&location=#{city_state}")
    JSON.parse(response.body, symbolize_names: true)[:results][0]
  end

end
