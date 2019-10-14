class AddColumnDepartamentoIdToTarefas < ActiveRecord::Migration[5.2]
  def change
    add_column :tarefas, :departamento_id, :integer
  end
end
