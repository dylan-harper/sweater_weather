class ForecastService

  def self.get_forecast_for(lat_long)
    get_data("/data/2.5/onecall?lat=39.738453&lon=-104.984853")
  end

private

  def self.conn
    Faraday.new(url: "https://api.openweathermap.org") do |faraday|
      faraday.params[:appid] = ENV['FORECAST_KEY']
    end
  end

  def self.get_data(url)
    response = conn.get(url)
     JSON.parse(response.body, symbolize_names: true)
  end

end
