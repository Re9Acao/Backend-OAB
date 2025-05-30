module Api
  module V1
    class QuestionsController < BaseCrudController
      def crud_model
        Question
      end

      def create
        question = Question.create(create_params)
          
        if question.errors.present?
          render json: question.errors.messages, status: :unprocessable_entity
        else
          render json: { 
            message: 'Questão criada com sucesso!', 
            question: question 
            }, status: :ok
        end
      end

      def update
        question_id = params[:id]
        question = Question.find_by(id: question_id)
        
        if question.present?
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
            :law_area_id,
            :question_type
          )
      
          if question.update(allowed_params)
            render json: { 
            message: 'Questão atualizada com sucesso!', 
            question: question 
            }, status: :ok
          else
            render json: { errors: question.errors.full_messages }, status: :unprocessable_entity
          end
        else
          render json: { message: 'Questão não encontrada' }, status: :not_found
        end
      end

      def create_params
        params.permit([:title, :evaluation_board, :year, :option_1, :option_2, :option_3, :option_4,  :option_5, :correct_answer, :available, :law_area_id])
      end
      
      def destroy
        question_id = params[:id]
        question = crud_model.find_by(id: question_id)
        
        if question.present?
          question.destroy
          render json: { message: 'Questão excluída com sucesso' }, status: :ok
        else
          render json: { error: 'Questão não encontrada' }, status: :not_found
        end
      end
    end
  end
end
