class AddColumnDepartamentoIdToColaboradors < ActiveRecord::Migration[5.2]
  def change
    add_column :colaboradors, :departamento_id, :integer
  end
end
