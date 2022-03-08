class Api::V1::UsersController < ApplicationController

  def create
    new_user = User.create(user_params)
    if new_user.save
      render json: UserSerializer.new(new_user), status: 200
    else
      render json: { error: new_user.errors, status: "400 Bad Request" }, status: 400
    end
  end

private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end
