require 'rails_helper'

RSpec.describe ImageService do
  describe 'class methods' do
    describe 'get_image_info' do
      it 'can search for images', :vcr do
        city_state = 'denver'
        info = ImageService.get_image_info(city_state)

        expect(info[0]).to have_key(:user)
        expect(info[0][:user]).to have_key(:username)
        expect(info[0][:user]).to have_key(:name)
        expect(info[0][:user][:links]).to have_key(:portfolio)
        expect(info[0]).to have_key(:id)
        expect(info[0]).to have_key(:urls)
        expect(info[0]).to have_key(:links)
      end
    end
  end
end
