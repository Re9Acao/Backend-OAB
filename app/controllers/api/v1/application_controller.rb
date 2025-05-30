module Api
  module V1
    class ApplicationController < ActionController::API
      include DeviseTokenAuth::Concerns::SetUserByToken
      before_action :authenticate_user!, unless: :devise_controller?
      respond_to :json

      rescue_from ActiveRecord::RecordNotFound, with: :not_found 

      private
      def authorize_admin!
        unless current_user&.role == 'admin'
          render json: { error: 'Não Autorizado' }, status: :unauthorized
        end
      end

      def not_found
        render json: { error: 'Registro não encontrado' }, status: :not_found
      end

      def forbidden
        render json: { error: 'Acesso negado' }, status: :forbidden
      end
    end
  end
end