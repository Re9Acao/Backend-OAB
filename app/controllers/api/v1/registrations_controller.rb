module Api
  module V1
    class RegistrationsController < DeviseTokenAuth::RegistrationsController

      private

      def render_destroy_success
        render json: { status: 'Sucesso', message: "Conta do usuário com UID '#{resource.uid}' foi excluída com sucesso." }
      end

    end
  end
end
