require 'rails_helper'

RSpec.describe BookSearch do

  before :each do
    @location = 'denver,co'
    @quantity = 5
    @forecast = ForecastFacade.get_forecast_for(@location)
    @book_search = BookSearch.new(@location, @quantity, @forecast)
  end

  it 'exists' do
    expect(@book_search).to be_a BookSearch
  end

  describe 'attributes' do
    it 'has destination' do
      expect(@book_search.destination).to eq(@location)
    end

    it 'has a forecast' do
      expect(@book_search.forecast).to have_key(:summary)
      expect(@book_search.forecast).to have_key(:temperature)
    end

    it 'has the total books found' do
      expect(@book_search.total_books_found).to be_an Integer
    end

    it 'has an array of books matching the quantity provided' do
      expect(@book_search.books).to be_an Array
      expect(@book_search.books.length).to eq(@quantity)
    end
  end

end
