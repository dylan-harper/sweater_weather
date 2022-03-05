require 'rails_helper'

RSpec.describe CoordinateService do
  describe 'class methods' do
    describe 'find_city_coordinates(city_state)', :vcr do
      city_state = 'denver,co'
      output = CoordinateService.find_city_coordindates(city_state)

      expect(output).to be_a Hash
      expect(output).to have_key(:info)
      expect(output).to have_key(:results)
      expect(output[:results]).to have_key(:providedLocation)
      expect(output[:results][:providedLocation]).to eq(city_state)
      expect(output[:results]).to have_key(:latLng)
      expect(output[:results][:latLng][:lat]).to eq("39.738453")
      expect(output[:results][:latLng][:lng]).to eq("-104.984853")
    end
  end
end
