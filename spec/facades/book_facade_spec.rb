require 'rails_helper'

RSpec.describe BookFacade do
  describe 'class methods' do
    describe '::search_books_about(location)' do
      it 'returns similar data to the book service', :vcr do
        location = 'denver,co'
        quantity = 5
        results = BookFacade.search_books_about(location)

        expect(results).to be_a Hash
        expect(results).to have_key(:numFound)

        results[:docs].take(quantity).each do |book|
          expect(book).to have_key(:title)
          expect(book).to have_key(:isbn)
          expect(book).to have_key(:publisher)
        end
      end
    end

    describe '::get_forecast_for(location)' do
      it 'can retrieve a forecast from the location query' do

      end
    end
  end
end
