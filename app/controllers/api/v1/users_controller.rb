module Api
  module V1
    class UsersController <   ApplicationController
      before_action :authenticate_user!

      before_action :authorize_admin!, only: [:index, :destroy]

      def index
        Rails.logger.info "Headers recebidos: #{request.headers.to_h.select { |k,_| k.start_with?('HTTP_') || k == 'Authorization' }}"
        Rails.logger.info "Current user no index: #{current_user.inspect}"

        users = User.all
        render json: users
      end

      def show
        Rails.logger.info "Headers recebidos: #{request.headers.to_h.select { |k,_| k.start_with?('HTTP_') || k == 'Authorization' }}"
        Rails.logger.info "Current user no show: #{current_user.inspect}"

        user = User.find(params[:id])
        render json: user
      end


      def update
        user = User.find(params[:id])
        if user.update(user_params)
          render json: user
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        user = User.find(params[:id])
        user.destroy
        render json: { status: 'Sucesso!', message: 'Usuário excluído' }
      end

      private

      def user_params
        params.require(:user).permit(:email, :role, :password, :password_confirmation)
      end
    end
  end
end