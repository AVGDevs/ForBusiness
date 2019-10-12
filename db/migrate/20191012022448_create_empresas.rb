class CreateEmpresas < ActiveRecord::Migration[5.2]
  def change
    create_table :empresas do |t|
      t.string :nomeEmpresa
      t.string :cnpjEmpresa
      t.string :statusEmpresa

      t.timestamps
    end
  end
end
