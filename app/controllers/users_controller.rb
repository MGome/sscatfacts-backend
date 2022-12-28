class UsersController < ApplicationController
  def create
    @user = User.new(username: params[:username])
    if @user.save
      render json: { body: ActiveSupport::JSON.encode(@user) }, status: 201
    else
      render json: { body: { errors: @user.errors.full_messages } }, status: 400
    end
  end

  def find_user
    @user = User.where(username: params[:username])
    if @user.present?
      render json: { body: ActiveSupport::JSON.encode(@user.first) }, status: 200
    else
      render json: { errors: 'No existe un usuario con este username' }, status: 404
    end
  end
end
