class DailyWeather

  attr_reader :data

  def initialize(data)
    @data = daily_data(data[0..4])
  end

  def daily_data(data)
    five_day_forecast = []
    data.each do |d|
      day = Hash.new
      day[:dt] = Time.at(d[:dt])
      day[:sunrise] = Time.at(d[:sunrise])
      day[:sunset] = Time.at(d[:sunset])
      day[:max_temp] = d[:temp][:max]
      day[:min_temp] = d[:temp][:min]
      day[:conditions] = d[:weather][0][:description]
      day[:icon] = d[:weather][0][:icon]
      five_day_forecast << day
    end
    five_day_forecast
  end

end
