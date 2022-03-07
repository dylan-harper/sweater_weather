class Api::V1::BooksController < ApplicationController

  def index
    results = BookFacade.get_results_for(params[:location], params[:quantity])
    render json: BooksSerializer.new(results)
  end

end
