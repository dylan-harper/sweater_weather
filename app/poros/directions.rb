class Directions

  attr_reader :id, :start_city, :end_city, :travel_time, :weather_at_eta

  def initialize(origin, destination, directions, weather_at_dest)
    @id = nil
    @start_city = origin
    @end_city = destination
    @travel_time = format_time(directions)
    @weather_at_eta = weather_at_dest.data
  end

  def format_time(directions)
    array = directions[:route][:formattedTime].split(":")
    travel_time = "#{array[0]} hour(s), #{array[1]} minutes, #{array[0]} seconds"
  end
end
