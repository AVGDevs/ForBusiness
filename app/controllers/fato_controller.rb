class FatoController < ApplicationController
  
  def fatos_params
    params.require(:fato).permit(:statusTarefa, :dataVencimentoTarefa, :tarefa_id, :empresa_id)
  end

  def index
    @fato = Fato.order :dataVencimentoTarefa
  end

  def new
    @fato = Fato.new
  end

  def create
    @fato = Fato.new(fatos_params)
    @fato.save

    redirect_to action: "new"
  end

  def folha_concluidas
    @folha_concluidas = Fato.where("statusTarefa = ? AND (tarefa_id = ? OR tarefa_id = ? OR tarefa_id = ?)", "Concluído", 1, 2, 3)
  end

  def folha_pendentes
    @folha_pendentes = Fato.where("statusTarefa = ? AND (tarefa_id = ? OR tarefa_id = ? OR tarefa_id = ?)", "Pendente", 1, 2, 3)
  end

  def concluir_folha
    @fato = Fato.find(params[:id])
    @fato.update_attributes(:statusTarefa => "Concluído")
    
    redirect_to action: "folha_pendentes"
  end

  def desfazer_folha
    @fato = Fato.find(params[:id])
    @fato.update_attributes(:statusTarefa => "Pendente")

    redirect_to action: "folha_concluidas"
  end

  def escrita_concluidas
    @escrita_concluidas = Fato.where("statusTarefa = ? AND (tarefa_id = ? OR tarefa_id = ? OR tarefa_id = ? OR tarefa_id = ? OR tarefa_id = ? OR tarefa_id = ?)", "Concluído", 4, 5, 6, 7, 8, 9)
  end

  def escrita_pendentes
    @escrita_pendentes = Fato.where("statusTarefa = ? AND (tarefa_id = ? OR tarefa_id = ? OR tarefa_id = ? OR tarefa_id = ? OR tarefa_id = ? OR tarefa_id = ?)", "Pendente", 4, 5, 6, 7, 8, 9)
  end

  def concluir_escrita
    @fato = Fato.find(params[:id])
    @fato.update_attributes(:statusTarefa => "Concluído")
    
    redirect_to action: "escrita_pendentes"
  end

  def desfazer_escrita
    @fato = Fato.find(params[:id])
    @fato.update_attributes(:statusTarefa => "Pendente")

    redirect_to action: "escrita_concluidas"
  end

  def ativo_concluidas
    @ativo_concluidas = Fato.where("statusTarefa = ? AND (tarefa_id = ? OR tarefa_id = ? OR tarefa_id = ?)", "Concluído", 10, 11, 12)
  end

  def ativo_pendentes
    @ativo_pendentes = Fato.where("statusTarefa = ? AND (tarefa_id = ? OR tarefa_id = ? OR tarefa_id = ?)", "Pendente", 10, 11, 12)
  end

  def concluir_ativo
    @fato = Fato.find(params[:id])
    @fato.update_attributes(:statusTarefa => "Concluído")
    
    redirect_to action: "ativo_pendentes"
  end

  def desfazer_ativo
    @fato = Fato.find(params[:id])
    @fato.update_attributes(:statusTarefa => "Pendente")

    redirect_to action: "ativo_concluidas"
  end

  def pagamento_recebimento_concluidas
    @pagamento_recebimento_concluidas = Fato.where("statusTarefa = ? AND (tarefa_id = ? OR tarefa_id = ? OR tarefa_id = ? OR tarefa_id = ?)", "Concluído", 13, 14, 15, 16)
  end

  def pagamento_recebimento_pendentes
    @pagamento_recebimento_pendentes = Fato.where("statusTarefa = ? AND (tarefa_id = ? OR tarefa_id = ? OR tarefa_id = ? OR tarefa_id = ?)", "Pendente", 13, 14, 15, 16)
  end

  def concluir_pagamento_recebimentos
    @fato = Fato.find(params[:id])
    @fato.update_attributes(:statusTarefa => "Concluído")
    
    redirect_to action: "pagamentos_recebimentos_pendentes"
  end

  def desfazer_pagamento_recebimentos
    @fato = Fato.find(params[:id])
    @fato.update_attributes(:statusTarefa => "Pendente")

    redirect_to action: "pagamentos_recebimentos_concluidas"
  end

  def estoque_concluidas
    @estoque_concluidas = Fato.where("statusTarefa = ? AND (tarefa_id = ? OR tarefa_id = ?)", "Concluído", 17, 18)
  end

  def estoque_pendentes
    @estoque_pendentes = Fato.where("statusTarefa = ? AND (tarefa_id = ? OR tarefa_id = ?)", "Pendente", 17, 18)
  end

  def concluir_estoque
    @fato = Fato.find(params[:id])
    @fato.update_attributes(:statusTarefa => "Concluído")
    
    redirect_to action: "estoque_pendentes"
  end

  def desfazer_estoque
    @fato = Fato.find(params[:id])
    @fato.update_attributes(:statusTarefa => "Pendente")

    redirect_to action: "estoque_concluidas"
  end

end
