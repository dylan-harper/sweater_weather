class Image

  attr_reader :id, :location, :image_url, :credit

  def initialize(data, location)
    @id = nil
    @location = location
    @image_url = data[0][:urls][:full]
    @credit = sources(data[0])
  end

  def sources(data)
    {
      source: 'unsplash.com',
      artist: data[:user][:username],
      link: data[:user][:links][:self]
    }
  end

end
