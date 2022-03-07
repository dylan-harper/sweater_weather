require 'rails_helper'

RSpec.describe BookService do
  describe 'class methods' do
    describe '::search(query)' do
      it 'can search books given parameters' do
        location = 'denver,co'
        quantity = 10
        results = BookService.search(location, quantity)

        expect(results).to be_a Hash
      end
    end
  end
end
