require 'rails_helper'

RSpec.describe 'forecast request', type: :request do
  it 'retrieves forecast data for a given city' do
    get "/api/v1/forecast?location=denver,co"
    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)

    require "pry"; binding.pry
  end

end
