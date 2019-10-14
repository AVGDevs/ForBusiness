class AddTarefaIdAndEmpresaIdToFatos < ActiveRecord::Migration[5.2]
  def change
    add_column :fatos, :tarefa_id, :integer
    add_column :fatos, :empresa_id, :integer
  end
end
