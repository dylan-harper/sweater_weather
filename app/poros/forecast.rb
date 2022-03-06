class Forecast

  attr_reader :current_weather, :daily_weather, :hourly_weather

  def initialize(data)
    @current_weather = current_weather_filter(data[:current])
    @daily_weather = daily_weather_filter(data[:daily][0..4])
    @hourly_weather = hourly_weather_filter(data[:hourly][0..7])
  end

  def current_weather_filter(data)
    output = {
      dt: data[:dt],
      sunrise: data[:sunrise],
      sunset: data[:sunset],
      temp: data[:temp],
      feels_like: data[:feels_like],
      humidity: data[:humidity],
      uvi: data[:uvi],
      visibility: data[:visibility],
      conditions: data[:weather][0][:description],
      icon: data[:weather][0][:icon]
    }
  end

  def daily_weather_filter(data)
    five_day_forecast = []

    data.each do |d|
      day = Hash.new
      day[:dt] = d[:dt]
      day[:sunrise] = d[:sunrise]
      day[:sunset] = d[:sunset]
      day[:max_temp] = d[:temp][:max]
      day[:min_temp] = d[:temp][:min]
      day[:conditions] = d[:weather][0][:description]
      day[:icon] = d[:weather][0][:icon]
      five_day_forecast << day
    end

    five_day_forecast
  end

  def hourly_weather_filter(data)
    eight_hour_forecast = []

    data.each do |d|
      hour = Hash.new
      hour[:dt] = d[:dt]
      hour[:temp] = d[:temp]
      hour[:conditions] = d[:weather][0][:description]
      hour[:icon] = d[:weather][0][:icon]
      eight_hour_forecast << hour
    end

    eight_hour_forecast
  end

end
