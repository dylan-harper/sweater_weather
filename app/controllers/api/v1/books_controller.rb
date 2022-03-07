class Api::V1::BooksController < ApplicationController

  def index
    if params[:location] == nil || params[:quantity] == nil || params[:location].blank?
      return render json: { error: 'Must enter a valid location and quantity in request parameters', status: "400 Bad Request" }, status: 400
    end

    if params[:quantity].to_i < 1
      return render json: { error: 'Quantity must be an integer above 0', status: "400 Bad Request" }, status: 400
    end

    results = BookFacade.get_results_for(params[:location], params[:quantity])
    render json: BooksSerializer.new(results)
  end

end
