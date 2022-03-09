class Api::V1::RoadtripController < ApplicationController

  def index
    user = User.find_by(api_key: params[:api_key])
    if !user
      render json: { error: "Invalid key", status: "401 Unauthorized" }, status: 401
    end

    directions = DirectionsFacade.get_directions_between(params[:origin], params[:destination])
    render json: RoadtripSerializer.new(directions)
  end

end
