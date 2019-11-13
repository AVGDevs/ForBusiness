class AddColumnDepartamentoIdToFatos < ActiveRecord::Migration[5.2]
  def change
    add_column :fatos, :departamento_id, :integer
  end
end
