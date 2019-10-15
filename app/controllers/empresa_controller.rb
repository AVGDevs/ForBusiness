class EmpresaController < ApplicationController
  
  def empresas_params
    params.require(:empresa).permit(:nomeEmpresa, :cnpjEmpresa, :statusEmpresa)
  end
  
  def index
    @empresa = Empresa.order :nomeEmpresa
  end

  def show
    @empresa = Empresa.find(params[:id])
  end

  def new
    @empresa = Empresa.new
  end

  def create
    @empresa = Empresa.new empresas_params
    @empresa.save

    redirect_to action: "index"
  end 

  def delete_empresa
    @empresa = Empresa.find(params[:id])
    @empresa.destroy

    redirect_to action: "index"
  end

end
