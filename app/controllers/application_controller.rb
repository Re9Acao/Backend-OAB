class ApplicationController < ActionController::API
  # tratamento genérico de exceções
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def not_found
    render json: { error: "Recurso não encontrado" }, status: :not_found
  end
end
