module Api
  module V1
    class ApplicationController < ActionController::API
      include DeviseTokenAuth::Concerns::SetUserByToken
      before_action :authenticate_user!
      helper_method :current_user

      # respond_to :json

      private

      def authorize_admin!
        unless current_user&.role == 'admin'
          render json: { error: 'Não autorizado' }, status: :unauthorized
        end
      end
    end
  end
end
