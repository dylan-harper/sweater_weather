class ForecastService

  def self.get_forecast_for(lat_long)
    get_data("/data/2.5/onecall?", lat_long)
  end

private

  def self.conn
    Faraday.new(url: "https://api.openweathermap.org") do |faraday|
      faraday.params['appid'] = ENV['FORECAST_KEY']
    end
  end

  def self.get_data(url, lat_long)
    response = conn.get(url) do |faraday|
      faraday.params['lat'] = lat_long[:lat]
      faraday.params['lon'] = lat_long[:lng]
      faraday.params['units'] = "imperial"
      faraday.params['exclude'] = "minutely"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end
