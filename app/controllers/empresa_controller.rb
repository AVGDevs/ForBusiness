class EmpresaController < ApplicationController
  
  def index
    @empresa = Empresa.order :nomeEmpresa
  end

  def empresas_params
    params.require(:empresa).permit(:nomeEmpresa, :cnpjEmpresa, :statusEmpresa)
  end

  def new
    @empresa = Empresa.new
  end

  def create
    @empresa = Empresa.new empresas_params
    @empresa.save
  end 

  def show
    @empresa = Empresa.find(params[:id])
  end

end
