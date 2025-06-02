class LawAreasController < BaseCrudController
  before_action :authenticate_admin!, only: [:create, :update]

  def crud_model
      LawArea
  end

  def create
    new_law_area = LawArea.new(law_area_params)

    if new_law_area.save
      render json: {
        message: 'Área do direito criada com sucesso!',
        law_area: new_law_area
      }, status: :created # Status 201
    else
      render json: {
        message: 'Erro ao criar área do direito',
        errors: new_law_area.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def update
    crud_instance_id = params[:id]
    new_name = params[:name]
    new_description = params[:description]
    
    crud_instance = crud_model.find_by(id: crud_instance_id)
      if crud_instance.present?
        if crud_instance.update(law_area_params)
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

  def destroy
    crud_instance_id = params[:id]
    crud_instance = crud_model.find_by(id: crud_instance_id) # Usar crud_model para consistência

    if crud_instance.present?
      crud_instance.destroy
      render json: { message: 'Área do direito excluída com sucesso!' }, status: :ok
    else
      render json: { message: 'Área do direito não encontrada' }, status: :not_found
    end
  rescue StandardError => e
    render json: { error: "Não foi possível excluir a área do direito: #{e.message}" }, status: :internal_server_error
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

  private
  def authenticate_admin!
    unless current_user && current_user.admin?
      render json: { error: "Acesso negado. Você não tem permissão de administrador para esta ação." }, status: :forbidden # 403 Forbidden
    end
  end

  def law_area_params
   params.require(:law_area).permit(:name, :description)
  end
end
