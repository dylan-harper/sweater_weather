class Image

  attr_reader :location, :image_url, :credit

  def initialize(data, location)
    @location = location
    @image_url = data[0][:urls][:full]
    @credit = sources(data[0])
  end

  #write unit test
  def sources(data)
    output = {
      source: 'unsplash.com',
      artist: data[:user][:username],
      link: data[:user][:links][:self]
    }
  end

end
