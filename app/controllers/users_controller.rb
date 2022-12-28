class UsersController < ApplicationController
  def create
    @user = User.new(username: params[:username])
    if @user.save
      render json: { body: ActiveSupport::JSON.encode(@user) }
    else
      render json: { body: { errors: @user.errors.full_messages } }
    end
  end

  def find_user
    @user = User.where(username: params[:username])
    if @user.present?
      render json: { body: ActiveSupport::JSON.encode(@user.first) }
    else
      render json: { errors: 'No existe un usuario con este username' }
    end
  end
end
