class Forecast

  attr_reader :id, :current_weather, :daily_weather, :hourly_weather

  def initialize(current_weather, daily_weather, hourly_weather)
    @id = nil
    @current_weather = current_weather.data
    @daily_weather = daily_weather.data
    @hourly_weather = hourly_weather.data
  end
end
