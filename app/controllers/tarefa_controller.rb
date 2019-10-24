class TarefaController < AdminsBackofficeController

  def tarefas_params
    params.require(:tarefa).permit(:nomeTarefa, :departamento_id)
  end

  def index
    @tarefa = Tarefa.order :nomeTarefa
  end

  def show
    @tarefa = Tarefa.find(params[:id])
  end

  def new
    @tarefa = Tarefa.new
  end

  def create
    @tarefa = Tarefa.new(tarefas_params)
    @tarefa.save

    redirect_to action: "index"
  end

  def edit
    @tarefa = Tarefa.find(params[:id])
  end

  def update 
    @tarefa = Tarefa.find(params[:id])
    @tarefa.update_attributes tarefas_params
        
    redirect_to action: "index"
  end

  def delete_tarefa
    @tarefa = Tarefa.find(params[:id])
    @tarefa.destroy

    redirect_to action: "index"
  end

end
