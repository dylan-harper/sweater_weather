require 'rails_helper'

RSpec.describe 'Books Request' do

  it 'retrieves books and forecast based on search', :vcr do
    location = 'denver,co'
    quantity = 5
    get "/api/v1/book-search?location=#{location}&quantity=#{quantity}"
    expect(response).to be_successful

    books = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(books[:type]).to eq('books')
    expect(books[:attributes][:destination]).to eq(location)
    expect(books[:attributes][:forecast]).to have_key(:summary)
    expect(books[:attributes][:forecast]).to have_key(:temperature)
    expect(books[:attributes][:total_books_found]).to be_an Integer
    expect(books[:attributes][:books].length).to eq(quantity)

    books[:attributes][:books].each do |i|
      expect(i).to have_key(:isbn)
      expect(i).to have_key(:title)
      expect(i).to have_key(:publisher)
    end
  end

end
