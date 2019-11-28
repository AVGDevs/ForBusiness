class AddColumnAbreviacaoToDepartamentos < ActiveRecord::Migration[5.2]
  def change
    add_column :departamentos, :abreviacao, :string
  end
end
