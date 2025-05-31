module Api
  module V1
    class UsersController < Api::V1::ApplicationController
      before_action :authenticate_user!
      before_action :authorize_admin!
      before_action :set_user, only: [:show, :update, :destroy]

      def index
        users = User.all
        render json: users
      end

      def check
        render json: { status: "OK" }
      end

      def show
        render json: @user
      end

      def update
        if @user.update(user_params)
          render json: @user
        else
          render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @user.destroy
        render json: { status: 'Sucesso!', message: 'Usuário excluído' }
      end

      private

      def set_user
        @user = User.find_by(id: params[:id])
        unless @user
          return render json: { error: "Usuário não encontrado" }, status: :not_found
        end
      end

      def user_params
        params.permit(:email, :role, :password, :password_confirmation)
      end

      def authorize_admin!
        unless current_user&.admin?
          render json: { error: "Acesso negado. Apenas administradores podem executar esta ação." }, status: :forbidden
        end

      end
    end
  end
end
