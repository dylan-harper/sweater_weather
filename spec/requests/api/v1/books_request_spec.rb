require 'rails_helper'

RSpec.describe 'Books Request' do

  it 'retrieves books and forecast based on search' do
    get "/api/v1/book-search?location=denver,co&quantity=5"
    expect(response).to be_successful

    books = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry
  end

end
