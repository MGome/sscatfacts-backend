class UsersController < ApplicationController
  def create
    @user = User.create(username: params[:username])
    render json: { body: @user }
  end
end
