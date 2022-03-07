require 'rails_helper'

RSpec.describe BookSearch do

  before :each do
    @location = 'denver,co'
    @quantity = 5
    @forecast = ForecastFacade.get_forecast_for(@location)
    @book_results = BookFacade.search_books_about(@location)
    @books = BookSearch.new(@location, @quantity, @book_results, @forecast)
  end

  it 'exists', :vcr do
    expect(@books).to be_a BookSearch
  end

  describe 'attributes' do
    it 'has destination', :vcr do
      expect(@books.destination).to eq(@location)
    end

    it 'has a forecast', :vcr do
      expect(@books.forecast).to have_key(:summary)
      expect(@books.forecast).to have_key(:temperature)
    end

    it 'has the total books found', :vcr do
      expect(@books.total_books_found).to be_an Integer
    end

    it 'has an array of books matching the quantity provided', :vcr do
      expect(@books.books).to be_an Array
      expect(@books.books.length).to eq(@quantity)

      @books.books.each do |book|
        expect(book).to have_key(:isbn)
        expect(book).to have_key(:title)
        expect(book).to have_key(:publisher)
      end
    end
  end

end
