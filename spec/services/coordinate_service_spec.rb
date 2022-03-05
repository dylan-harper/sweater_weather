require 'rails_helper'

RSpec.describe CoordinateService do
  describe 'class methods' do
    describe 'find_city_coordinates(city_state)' do
      it 'can get a citys coordinates' do
        city_state = 'denver,co'
        output = CoordinateService.get_city_coordinates(city_state)

        expect(output).to be_a Hash
        expect(output).to have_key(:info)
        expect(output).to have_key(:results)
        expect(output[:results]).to be_an Array
        expect(output[:results][0]).to have_key(:providedLocation)
        expect(output[:results][0][:providedLocation][:location]).to eq(city_state)
        expect(output[:results][0][:locations][1]).to have_key(:latLng)
        expect(output[:results][0][:locations][1][:latLng][:lat].to_s).to eq("39.738453")
        expect(output[:results][0][:locations][1][:latLng][:lng].to_s).to eq("-104.984853")
      end
    end
  end
end
