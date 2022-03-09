class Directions

  attr_reader :start_city, :end_city, :travel_time, :weather_at_eta

  def initialize(origin, destination, directions, forecast_at_dest)
    @start_city = origin
    @end_city = destination
    @travel_time = format_time(directions)
    @weather_at_eta = find_weather(directions, forecast_at_dest)
  end

  def format_time(directions)
    array = split_time_string(directions)
    if array[0].to_i > 48
      return 'impossible'
    end
    travel_time = "#{array[0]} hour(s), #{array[1]} minutes, #{array[0]} seconds"
  end

  def find_weather(directions, forecast_at_dest)
    array = split_time_string(directions)
    if array[0].to_i < 8
      return hourly_forecast(array[0].to_i, forecast_at_dest)
    elsif array[0].to_i > 48
      return nil
    end
  end

  def split_time_string(directions)
    directions[:route][:formattedTime].split(":")
  end

  def hourly_forecast(hours_ahead, forecast_at_dest)
    if hours_ahead == 0
      return {
        temperature: forecast_at_dest[:current][:temp],
        conditions: forecast_at_dest[:current][:conditions][0][:description]
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
