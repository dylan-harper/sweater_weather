require 'rails_helper'

RSpec.describe CoordinateService do
  describe 'class methods' do
    describe 'get_city_coordinates(city_state)' do
      it 'can get a citys coordinates' do
        city_state = 'denver,co'
        output = CoordinateService.get_city_coordinates(city_state)

        expect(output).to be_a Hash
        expect(output).to_not have_key(:info)
        expect(output).to_not have_key(:results)
        expect(output).to have_key(:providedLocation)
        expect(output[:providedLocation][:location]).to eq(city_state)
        expect(output[:locations]).to be_an Array
        expect(output[:locations][1]).to have_key(:latLng)
        expect(output[:locations][1][:latLng][:lat].to_s).to eq("39.738453")
        expect(output[:locations][1][:latLng][:lng].to_s).to eq("-104.984853")
      end
    end
  end
end
