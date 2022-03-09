class WeatherAtX

  attr_reader :data

  def initialize(directions, forecast_at_dest)
    @data = find_weather(directions, forecast_at_dest)
  end

  def find_weather(directions, forecast_at_dest)
    array = directions[:route][:formattedTime].split(":")
    hourly_forecast(array[0].to_i, forecast_at_dest)
  end

  def hourly_forecast(hours_ahead, forecast_at_dest)
    if hours_ahead == 0
      return {
        temperature: forecast_at_dest[:current][:temp],
        conditions: forecast_at_dest[:current][:weather][0][:description]
       }
    end

    forecast_at_dest[:hourly].each_with_index do |forecast, index|
      if index == hours_ahead - 1
        return {
          temperature: forecast[:temp],
          conditions: forecast[:weather][0][:description]
        }
      end
    end
  end
end
