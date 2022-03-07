class Api::V1::ForecastController < ApplicationController

  def index
    forecast = ForecastFacade.get_forecast_for(params[:location])
    render json: ForecastSerializer.new(forecast)
  end

end
