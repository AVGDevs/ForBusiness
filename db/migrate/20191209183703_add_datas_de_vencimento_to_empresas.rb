class AddDatasDeVencimentoToEmpresas < ActiveRecord::Migration[5.2]
  def change
    add_column :empresas, :entregaAtivoFixo, :integer
    add_column :empresas, :entregaEscritaFiscal, :integer
    add_column :empresas, :entregaEstoque, :integer
    add_column :empresas, :entregaFolhaDePagamento, :integer
    add_column :empresas, :entregaPgtoERecebimento, :integer	
  end
end
