class FatoController < ApplicationController

  before_action :authenticate_user! 
  layout 'users_backoffice'
  
  def fatos_params
    params.require(:fato).permit(:statusTarefa, :dataVencimentoTarefa, :tarefa_id, :empresa_id, :departamento_id)
  end

  def index
    @fato = Fato.where("departamento_id = ? AND status_id = ?", params[:departamento_id], params[:status_id])
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
    redirect_back fallback_location: {controller: 'fato', action: 'index' }
  end

  def desfazer_conclusao
    @fato = Fato.find(params[:id])
    @fato.update_attribute(:status_id, 2)
    registrar_log("Desfez")
    redirect_back fallback_location: {controller: 'fato', action: 'index' }
  end

end
