require 'rails_helper'

RSpec.describe BookFacade do
  describe 'class methods' do
    describe '::search_books_from(location)' do
      it 'returns a limited array of book poros' do
        location = 'denver,co'
        quantity = 5
        results = BookFacade.search_books_from(location)

        expect(results).to be_an Array
      end
    end
  end
end
