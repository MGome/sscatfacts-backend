class UsersController < ApplicationController
  def create
    @user = User.new(username: params[:username])
    if @user.save
      render json: { body: @user }
    else
      render json: { body: { errors: @user.errors.full_messages } }
    end
  end
end
