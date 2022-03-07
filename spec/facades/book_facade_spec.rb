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

    describe '::get_results_for(location)', :vcr do
      it 'can combine book search and forecast data into poro' do
        location = 'denver,co'
        quantity = 5

        output = BookFacade.get_results_for(location, quantity)

        expect(output).to be_a BookSearch
        expect(output.destination).to eq(location)
        expect(output.books.length).to eq(quantity)
        expect(output.forecast).to be_a Hash
        expect(output.total_books_found).to be_an Integer
      end
    end

  end
end
