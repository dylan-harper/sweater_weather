require 'rails_helper'

RSpec.describe ImageFacade do
  describe 'class methods' do
    describe '::get_image_for(location)' do

      it 'outputs an image poro', :vcr do
        @location = 'denver,co'
        @image = ImageFacade.get_image_for(@location)

        expect(@image).to be_an Image
      end
    end
  end
end
