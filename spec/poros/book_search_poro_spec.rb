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

end
