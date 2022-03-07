require 'rails_helper'

RSpec.describe Image do
  before :each do
    @location = 'denver,co'
    @image = ImageFacade.get_image_for(@location)
  end

  it 'exists', :vcr do
    expect(@image).to be_an Image
  end

  describe 'attributes', :vcr do
    it 'has location' do
      expect(@image.location).to eq(@location)
    end

    it 'has an image_url', :vcr do
      expect(@image.image_url).to include("http")
    end

    it 'has a credit attribute', :vcr do
      expect(@image.credit).to be_a Hash
      expect(@image.credit).to have_key(:source)
      expect(@image.credit).to have_key(:artist)
      expect(@image.credit).to have_key(:link)
    end
  end
end
