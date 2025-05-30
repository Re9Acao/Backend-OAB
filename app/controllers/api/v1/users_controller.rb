module Api
  module V1
    class UsersController < ApplicationController
      before_action :authorize_admin!, only: [:index, :destroy] 

      def index
        users = User.all
        render json: users, status: :ok
      end

      def test_inheritance
        render json: { parent_class: self.class.superclass.name }
      end

      def show
        user = User.find(params[:id])
        render json: user, status: :ok
      end

      def update
        user = User.find(params[:id])
        if user.update(user_params)
          render json: user, status: :ok
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        Rails.logger.info "Current user: #{current_user.inspect}"
        user = User.find(params[:id])
        user.destroy
        render json: { status: 'Sucesso!', message: 'Usuário excluído' }
      end

      private

      def set_user
      @user = User.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Usuário não encontrado' }, status: :not_found
      end

      def user_params
        params.require(:user).permit(:email, :role, :password, :password_confirmation)
      end
    end
  end
end