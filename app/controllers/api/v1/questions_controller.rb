module Api
  module V1
    class QuestionsController < BaseCrudController
      def crud_model
        Question
      end

      def create
        new_crud_instance = Question.create(create_params)
          
        if new_crud_instance.errors.present?
          render json: new_crud_instance.errors.messages, status: 422
        else
          render json: { 
            message: 'Questão criada com sucesso!', 
            question: new_crud_instance 
            }, status: :ok
        end
      end

      def update
        crud_instance_id = params[:id]
        crud_instance = Question.find_by(id: crud_instance_id)
        
        if crud_instance.present?
          allowed_params = params.permit(
            :title, 
            :evaluation_board, 
            :year, 
            :option_1, 
            :option_2, 
            :option_3, 
            :option_4, 
            :option_5, 
            :correct_answer, 
            :available, 
            :law_area_id
          )
      
          if crud_instance.update(allowed_params)
            render json: { 
            message: 'Questão atualizada com sucesso!', 
            question: crud_instance 
            }, status: :ok
          else
            render json: { errors: crud_instance.errors.full_messages }, status: :unprocessable_entity
          end
        else
          render json: { message: 'Questão não encontrada' }, status: :not_found
        end
      end

      def create_params
        params.permit([:title, :evaluation_board, :year, :option_1, :option_2, :option_3, :option_4,  :option_5, :correct_answer, :available, :law_area_id])
      end
    end

  end
end
