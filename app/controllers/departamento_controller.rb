class DepartamentoController < ApplicationController
  
  def departamento_params
    params.require(:departamento).permit(:nomeDepartamento)
  end

  def index
    @departamento = Departamento.order :nomeDepartamento
  end

  def show
    @departamento = Departamento.find(params[:id])
  end

  def new
    @departamento = Departamento.new
  end

  def create
    @departamento = Departamento.new departamento_params
    @departamento.save

    redirect_to action: "index"
  end 

  def delete_departamento
    @departamento = Departamento.find(params[:id])
    @departamento.desytroy

    redirect_to action: "index"
  end

end
