require 'rails_helper'

RSpec.describe 'Image Request' do
  it 'retrieves image data for a given city', :vcr do
    get "/api/v1/image?location=denver,co"
    expect(response).to be_successful

    image = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(image[:id]).to eq(nil)
    expect(image[:type]).to eq('image')
    expect(image[:attributes][:location]).to eq('denver,co')
    expect(image[:attributes]).to have_key(:image_url)
    expect(image[:attributes]).to have_key(:credit)
    expect(image[:attributes][:credit]).to be_a Hash
  end
end
