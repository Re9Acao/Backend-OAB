module Api
  module V1
    class LawAreasController < BaseCrudController
      def crud_model
          LawArea
      end

      def create_params
          params.permit([:name, :description])
      end

      def update
          crud_instance_id = params[:id]
          new_name = params[:name]
          new_description = params[:description]
          
          crud_instance = crud_model.find_by(id: crud_instance_id)
        
          if crud_instance.present?
            if crud_instance.update(name: new_name, description: new_description)
              render json: { 
                message: "Atualização realizada com sucesso.", 
                instance: crud_instance 
              }, status: :ok
            else
              render json: { 
                message: "Erro ao atualizar",
                errors: crud_instance.errors.full_messages 
              }, status: :unprocessable_entity
            end
          else
            render json: { message: "Área não encontrada" }, status: :not_found
          end
      end

      def questions
          lawarea = LawArea.find_by(id: params[:id])
          if lawarea.present?
              questions = lawarea.questions
              render json: questions, status: :ok
          else
              render json: {error: "Área não encontrada"}, status: :not_found
          end
      end
    end  
  end
end
