class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])

    if !user
      render json: { error: "User does not exist", status: "404 Not Found" }, status: 404
    elsif user && user.authenticate(params[:password])
      render json: UserSerializer.new(user), status: 200
    else
      render json: { error: "Bad credentials", status: "400 Bad Request" }, status: 400
    end
  end
end
