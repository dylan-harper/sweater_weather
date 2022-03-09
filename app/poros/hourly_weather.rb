class HourlyWeather

  attr_reader :data

  def initialize(data)
    @data = hourly_data(data[0..7])
  end

  def hourly_data(data)
      eight_hour_forecast = []
      data.each do |d|
        hour = Hash.new
        hour[:dt] = Time.at(d[:dt])
        hour[:temp] = d[:temp]
        hour[:conditions] = d[:weather][0][:description]
        hour[:icon] = d[:weather][0][:icon]
        eight_hour_forecast << hour
      end
      eight_hour_forecast
  end

end
