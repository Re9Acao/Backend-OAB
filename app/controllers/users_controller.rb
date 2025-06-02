class UsersController < ApplicationController
  before_action :authorize_admin!, only: [:destroy]

  def index
    users = User.all
    render json: users
  end


  def show
    user = User.find(params[:id])
    render json: user
  end

  # atualizar usuário
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # deletar usuário (só admin)
  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: { status: 'success', message: 'User deleted' }
  end

  private

  def user_params
    params.require(:user).permit(:email, :role, :password, :password_confirmation)
  end
end