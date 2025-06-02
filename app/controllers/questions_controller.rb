class QuestionsController < BaseCrudController
  before_action :authenticate_admin!, only: [:create, :update, :destroy, :random]

  def crud_model
    Question
  end

  # def create
  #   new_crud_instance = Question.create(create_params)
      
  #   if new_crud_instance.errors.present?
  #     render json: new_crud_instance.errors.messages, status: 422
  #   else
  #     render json: { 
  #       message: 'Questão criada com sucesso!', 
  #       question: new_crud_instance 
  #       }, status: :ok
  #   end
  # end

   def create
    question_params = params.require(:question).permit(
      :title, :evaluation_board, :year, :option_1, :option_2, :option_3,
      :option_4, :option_5, :correct_answer, :available, :question_type
    )

    law_area_name = params[:law_area_name]
    law_area = LawArea.find_by(name: law_area_name)

    if law_area.nil?
      render json: { error: "Área do direito '#{law_area_name}' não encontrada." }, status: :not_found
      return
    end

    question_params[:law_area_id] = law_area.id

    @question = Question.new(question_params)

    if @question.save
      render json: @question, status: :created, location: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end


  def update
    crud_instance_id = params[:id]
    crud_instance = Question.find_by(id: crud_instance_id)
    
    if crud_instance.present?
      allowed_params = params.require(:question).permit(
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

  def random
    @questions = Question.order("RANDOM()").limit(5)

    render json: @questions, status: :ok
  rescue StandardError => e
    render json: { error: "Não foi possível buscar questões aleatórias: #{e.message}" }, status: :internal_server_error
  end

  def destroy
    crud_instance_id = params[:id]
    crud_instance = Question.find_by(id: crud_instance_id)

    if crud_instance.present?
      crud_instance.destroy
      render json: { message: 'Questão excluída com sucesso!' }, status: :ok
    else
      render json: { message: 'Questão não encontrada' }, status: :not_found
    end
  rescue StandardError => e
    render json: { error: "Não foi possível excluir a questão: #{e.message}" }, status: :internal_server_error
  end



  private

  def create_params
    params.permit([:title, :evaluation_board, :year, :option_1, :option_2, :option_3, :option_4,  :option_5, :correct_answer, :available, :law_area_id])
  end

  def authenticate_admin!
    # current_user é fornecido pelo Devise Token Auth (ou sua gem de autenticação)
    unless current_user && current_user.admin? # Ou current_user.role == 'admin'
      render json: { error: "Acesso negado. Você não tem permissão de administrador para esta ação." }, status: :forbidden # 403 Forbidden
    end
  end
end