require 'rails_helper'

RSpec.describe DirectionsService do
  describe 'class methods' do
    describe 'find_route_between(origin, destination)' do
      it 'can get a route' do
        origin = "Denver,CO"
        destination = "Pueblo,CO"

        result = DirectionsService.find_route_between(origin, destination)
        expect(result).to be_a Hash
        expect(result).to have_key(:route)
        expect(result[:route]).to have_key(:realTime)
        expect(result[:route]).to have_key(:formattedTime)
        expect(result[:route][:legs][0][:destNarrative]).to include("PUEBLO, CO")
      end
    end
  end
end
