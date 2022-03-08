class Api::V1::UsersController < ApplicationController

  def create
    new_user = User.create(user_params)
    if new_user.present?
      render json: UserSerializer.new(new_user)
    else
      render status: 400
    end
  end

private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end
