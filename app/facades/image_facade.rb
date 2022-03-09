class ImageFacade

  def self.get_image_for(location)
    city = location.split(',')
    data = ImageService.get_image_info(city[0])
    Image.new(data, location)
  end
end
