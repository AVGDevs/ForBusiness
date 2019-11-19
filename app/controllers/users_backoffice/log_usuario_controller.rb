class UsersBackoffice::LogUsuarioController < UsersBackofficeController

  before_action :authenticate_user!
  layout 'users_backoffice'

  def historico
    @tarefa = LogUsuario.where('tarefa_id = ?', params[:tarefa_id])
  end



end
