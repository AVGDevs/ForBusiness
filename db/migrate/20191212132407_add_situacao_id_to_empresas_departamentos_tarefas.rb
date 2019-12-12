class AddSituacaoIdToEmpresasDepartamentosTarefas < ActiveRecord::Migration[5.2]
  def change
    remove_column :empresas, :statusEmpresa
    add_column :empresas, :situacao_id, :integer
    add_column :departamentos, :situacao_id, :integer
    add_column :tarefas, :situacao_id, :integer 
  end
end
