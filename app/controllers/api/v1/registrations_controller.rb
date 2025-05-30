module Api
  module V1
    class RegistrationsController < DeviseTokenAuth::RegistrationsController
      # variável de instância para guardar o UID antes de apagar
      before_action :store_uid_before_destroy, only: [:destroy]

      def destroy
        super
      end

      private

      def store_uid_before_destroy
        # Guarda o uid do resource (usuário atual) em uma variável de instância
        @user_uid = resource.uid if resource.present?
      end

      def render_destroy_success
        render json: { status: 'Sucesso', message: "Conta do usuário com UID '#{@user_uid}' foi excluída com sucesso." }
      end
    end
  end
end
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
