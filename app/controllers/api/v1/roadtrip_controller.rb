class Api::V1::RoadtripController < ApplicationController

  def index
    user = User.find_by(api_key: params[:api_key])
    if !user
      render json: { error: "Invalid key", status: "401 Unauthorized" }, status: 401
    elsif user
      directions = DirectionsFacade.get_directions_between(params[:origin], params[:destination])
      if directions == nil
        return render json: { error: 'impossible', status: '400'}, status: 400
      else
        render json: RoadtripSerializer.new(directions)
      end
    end
  end
end
