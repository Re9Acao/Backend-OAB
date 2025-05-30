module Api
  module V1
    class RegistrationsController < DeviseTokenAuth::RegistrationsController
      before_action :store_uid_before_destroy, only: [:destroy]

      def destroy
        super
      end

      private

      def store_uid_before_destroy
        @user_uid = resource.uid if resource.present?
      end

      def render_destroy_success
        render json: { status: 'Sucesso', message: "Conta do usuário foi excluída com sucesso." }
      end
    end
  end
end