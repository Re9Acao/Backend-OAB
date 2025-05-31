class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken 
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  

  private

  def not_found
    render json: { error: "Recurso não encontrado" }, status: :not_found
  end
end