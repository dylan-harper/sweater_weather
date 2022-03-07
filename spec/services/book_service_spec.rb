require 'rails_helper'

RSpec.describe BookService do
  describe 'class methods' do
    describe '::search(query)' do
      it 'can search books given parameters', :vcr do
        location = 'denver,co'
        quantity = 10
        results = BookService.search(location)

        expect(results).to be_a Hash
        expect(results[:docs]).to be_an Array

        results[:docs].take(quantity).each do |book|
          expect(book).to have_key(:title)
          expect(book).to have_key(:isbn)
          expect(book).to have_key(:publisher)
        end
      end
    end
  end
end
