require 'rails_helper'

RSpec.describe DirectionsFacade do

   it 'exists' do
     expect(DirectionsFacade.new).to be_a DirectionsFacade
   end

   describe 'class methods' do
     describe '::get_directions_between(origin, destination)', :vcr do
       it 'returns a directions poro' do
         origin = "Denver,CO"
         destination = "Pueblo,CO"
         result = DirectionsFacade.get_directions_between(origin, destination)

         expect(result).to be_a Directions
       end
     end
   end


end
