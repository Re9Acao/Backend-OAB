class RegistrationsController < DeviseTokenAuth::RegistrationsController

  private

  def render_destroy_success
    render json: { status: 'Sucesso!', message: "Conta do usuário excluída com sucesso" }
  end

end