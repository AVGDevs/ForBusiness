class ColaboradorController < AdminsBackofficeController

  def colaboradors_params
    params.require(:colaborador).permit(:nomeColaborador, :cpfColaborador, :setorColaborador, :departamento_id)
  end

  def index
    @colaborador = Colaborador.order :nomeColaborador
  end

  def show
    @colaborador = Colaborador.find(params[:id])
  end

  def new
    @colaborador = Colaborador.new
  end

  def create
    @colaborador = Colaborador.new(colaboradors_params)
    @colaborador.save

    redirect_to action: "index"
  end 

  def edit
    @colaborador = Colaborador.find(params[:id])
  end

  def update 
    @colaborador = Colaborador.find(params[:id])
    @colaborador.update_attributes colaboradors_params
    
    redirect_to action: "index"
  end

  def delete_colaborador
    @colaborador = Colaborador.find(params[:id])
    @colaborador.destroy

    redirect_to action: "index"
  end

end
