class DepartamentoController < AdminsBackofficeController
  
  def departamento_params
    params.require(:departamento).permit(:nomeDepartamento, :abreviacao)
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

  def edit
    @departamento = Departamento.find(params[:id])
  end

  def update 
    @departamento = Departamento.find(params[:id])
    @departamento.update_attributes departamento_params
    
    redirect_to action: "index"
  end

  def delete_departamento
    @departamento = Departamento.find(params[:id])
    @departamento.destroy

    redirect_to action: "index"
  end

end
