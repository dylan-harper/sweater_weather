class ImageService

  def self.get_image_info(city)
    get_data("/search/photos?query=#{city}")[:results]
  end

  def self.conn
    Faraday.new(url:"https://api.unsplash.com") do |faraday|
     faraday.params[:client_id] = ENV['IMAGE_KEY']
    end
  end

  def self.get_data(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

end
