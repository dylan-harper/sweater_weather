class BookService

  def self.search(location, quantity)
    loc = location.split(',')
    get_data("/search.json?q=#{loc[0]}+#{loc[1]}&limit=#{quantity}")
  end

private

  def self.conn
    Faraday.new(url:"https://api.openweathermap.org") do |faraday|
      #params as needed
    end
  end

  def self.get_data(url)
    response = conn.get(url) do |faraday|
      #params as needed
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end
