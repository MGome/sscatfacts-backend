class UsersController < ApplicationController
  def create
    @user = User.new(username: params[:username])
    if @user.save
      render json: { body: ActiveSupport::JSON.encode(@user) }, status: :created
    else
      return render json: { errors: 'Ingresa un nombre válido' }, status: :bad_request if params[:username].blank?

      render json: { errors: 'Nombre de usuario en uso' }, status: :bad_request
    end
  end

  def find_user
    @user = User.where(username: params[:username])
    if @user.present?
      render json: { body: ActiveSupport::JSON.encode(@user.first) }, status: :ok
    else
      render json: { errors: 'No existe un usuario con este username' }, status: :not_found
    end
  end
end
