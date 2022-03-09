class CurrentWeather

  attr_reader :data

  def initialize(data)
    @data = current_data(data)
  end

  def current_data(data)
    {
      dt: Time.at(data[:dt]),
      sunrise: Time.at(data[:sunrise]),
      sunset: Time.at(data[:sunset]),
      temp: data[:temp],
      feels_like: data[:feels_like],
      humidity: data[:humidity],
      uvi: data[:uvi],
      visibility: data[:visibility],
      conditions: data[:weather][0][:description],
      icon: data[:weather][0][:icon]
    }
  end


end
