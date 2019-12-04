class UsersBackoffice::FatoController < UsersBackofficeController

  before_action :authenticate_user! 
  layout 'users_backoffice'
  
  def fatos_params
    params.require(:fato).permit(:statusTarefa, :dataVencimentoTarefa, :tarefa_id, :empresa_id, :departamento_id)
  end

  def index
    dropdown_mesano

    @fato = Fato.where("departamento_id = ? AND status_id = ? AND REPLACE(RIGHT(date_format(str_to_date(dataVencimentoTarefa, '%Y-%m-%d'), '%d/%m/%Y'),7),'/','') = ?", params[:departamento_id], params[:status_id], params[:mesano])
  end

  def new
    @fato = Fato.new
  end

  def create
    @fato = Fato.new(fatos_params)
    @fato.save

    redirect_to action: "new"
  end

  def show
    @fato = Fato.find(params[:id])
  end

  private def registrar_log (acao)
    @tarefa_id = params[:id]
    @email = current_user.email
    log = "INSERT INTO log_usuarios (tarefa_id, email, acao) VALUES (#{@tarefa_id}, '#{@email}', '#{acao}');"
    ActiveRecord::Base.connection.execute(log);    
  end

  def concluir_tarefa
    @fato = Fato.find(params[:id])
    @fato.update_attribute(:status_id, 1)
    registrar_log("Concluiu")
    redirect_back fallback_location: {controller: 'users_backoffice/fato', action: 'index' }
  end

  def desfazer_conclusao
    @fato = Fato.find(params[:id])
    @fato.update_attribute(:status_id, 2)
    registrar_log("Desfez")
    redirect_back fallback_location: {controller: 'users_backoffice/fato', action: 'index' }
  end

  private def dropdown_mesano
    conn = ActiveRecord::Base.connection
    @mesano = conn.execute "SELECT DISTINCT RIGHT(date_format(str_to_date(dataVencimentoTarefa, '%Y-%m-%d'), '%d/%m/%Y'),7) AS mesano, REPLACE(RIGHT(date_format(str_to_date(dataVencimentoTarefa, '%Y-%m-%d'), '%d/%m/%Y'),7),'/','') AS mesano_value FROM fatos;"
  end

end
