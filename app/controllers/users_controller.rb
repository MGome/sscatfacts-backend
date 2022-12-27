class UsersController < ApplicationController
  def create
    @user = User.create(params[:username])
    render json: { body: @user }
  end
end
