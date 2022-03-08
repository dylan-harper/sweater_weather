class DirectionsService

  def self.find_route_between(origin, destination)
    get_data("/directions/v2/route?formattedTime", origin, destination)
  end

private

  def self.conn
    Faraday.new(url: "http://www.mapquestapi.com") do |faraday|
      faraday.params['key'] = ENV['GEOCODE_KEY']
    end
  end

  def self.get_data(url, origin, destination)
    response = conn.get(url) do |faraday|
      faraday.params['from'] = origin
      faraday.params['to'] = destination
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end
