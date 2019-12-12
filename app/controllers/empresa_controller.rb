class EmpresaController < AdminsBackofficeController
  def index
  end
  
  def empresas_params
    params.require(:empresa).permit(:nomeEmpresa, :cnpjEmpresa, :situacao_id, :entregaAtivoFixo, :entregaEscritaFiscal, :entregaEstoque, :entregaFolhaDePagamento,:entregaPgtoERecebimento)
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

  def edit
    @empresa = Empresa.find(params[:id])
  end

  def update 
    @empresa = Empresa.find(params[:id])
    @empresa.update_attributes empresas_params
    
    redirect_to action: "index"
  end

  def delete_empresa
    @empresa = Empresa.find(params[:id])
    @empresa.destroy

    redirect_to action: "index"
  end

  def criar_tarefas_mensais
    conn = ActiveRecord::Base.connection

    #Folha de pagamento
    @empresas = conn.execute "SELECT id, CONCAT(DATE_FORMAT(STR_TO_DATE(NOW(), '%Y-%m-%d %H:%i'), '%Y-%m'), '-' , entregaFolhaDePagamento) AS entrega_folha FROM empresas WHERE situacao_id = 1;"

    @tarefas = conn.execute "SELECT t.id AS id_tarefa, d.id AS id_departamento FROM departamentos AS d JOIN tarefas AS t ON t.departamento_id = d.id WHERE departamento_id = 1 AND d.situacao_id = 1 AND t.situacao_id = 1;"

    @empresas.each do |e|     
      @tarefas.each do |t|
        @hora_atual = conn.select_one "SELECT date_format(str_to_date(NOW(), '%Y-%m-%d %H:%i'), '%Y-%m-%d %H:%i') AS hora_atual;"
        empresa_tarefa = "INSERT INTO fatos (dataVencimentoTarefa, tarefa_id, empresa_id, departamento_id, status_id, created_at, updated_at) VALUES ('#{e[1]}', #{t[0]}, #{e[0]}, #{t[1]}, 2, '#{@hora_atual['hora_atual']}', '#{@hora_atual['hora_atual']}');" 
        ActiveRecord::Base.connection.execute(empresa_tarefa);  
      end
    end

    #Escrita fiscal
    @empresas = conn.execute "SELECT id, CONCAT(DATE_FORMAT(STR_TO_DATE(NOW(), '%Y-%m-%d %H:%i'), '%Y-%m'), '-' , entregaEscritaFiscal) AS entrega_escrita FROM empresas WHERE situacao_id = 1;"

    @tarefas = conn.execute "SELECT t.id AS id_tarefa, d.id AS id_departamento FROM departamentos AS d JOIN tarefas AS t ON t.departamento_id = d.id WHERE departamento_id = 2 AND d.situacao_id = 1 AND t.situacao_id = 1;"

    @empresas.each do |e|     
      @tarefas.each do |t|
        @hora_atual = conn.select_one "SELECT date_format(str_to_date(NOW(), '%Y-%m-%d %H:%i'), '%Y-%m-%d %H:%i') AS hora_atual;"
        empresa_tarefa = "INSERT INTO fatos (dataVencimentoTarefa, tarefa_id, empresa_id, departamento_id, status_id, created_at, updated_at) VALUES ('#{e[1]}', #{t[0]}, #{e[0]}, #{t[1]}, 2, '#{@hora_atual['hora_atual']}', '#{@hora_atual['hora_atual']}');" 
        ActiveRecord::Base.connection.execute(empresa_tarefa);  
      end
    end
  
    #Ativo
    @empresas = conn.execute "SELECT id, CONCAT(DATE_FORMAT(STR_TO_DATE(NOW(), '%Y-%m-%d %H:%i'), '%Y-%m'), '-' , entregaAtivoFixo) AS entrega_ativo FROM empresas WHERE situacao_id = 1;"

    @tarefas = conn.execute "SELECT t.id AS id_tarefa, d.id AS id_departamento FROM departamentos AS d JOIN tarefas AS t ON t.departamento_id = d.id WHERE departamento_id = 3 AND d.situacao_id = 1 AND t.situacao_id = 1;"

    @empresas.each do |e|     
      @tarefas.each do |t|
        @hora_atual = conn.select_one "SELECT date_format(str_to_date(NOW(), '%Y-%m-%d %H:%i'), '%Y-%m-%d %H:%i') AS hora_atual;"
        empresa_tarefa = "INSERT INTO fatos (dataVencimentoTarefa, tarefa_id, empresa_id, departamento_id, status_id, created_at, updated_at) VALUES ('#{e[1]}', #{t[0]}, #{e[0]}, #{t[1]}, 2, '#{@hora_atual['hora_atual']}', '#{@hora_atual['hora_atual']}');" 
        ActiveRecord::Base.connection.execute(empresa_tarefa);  
      end
    end

    #Pgto
    @empresas = conn.execute "SELECT id, CONCAT(DATE_FORMAT(STR_TO_DATE(NOW(), '%Y-%m-%d %H:%i'), '%Y-%m'), '-' , entregaPgtoERecebimento) AS entrega_pgto FROM empresas WHERE situacao_id = 1;"

    @tarefas = conn.execute "SELECT t.id AS id_tarefa, d.id AS id_departamento FROM departamentos AS d JOIN tarefas AS t ON t.departamento_id = d.id WHERE departamento_id = 4 AND d.situacao_id = 1 AND t.situacao_id = 1;"

    @empresas.each do |e|     
      @tarefas.each do |t|
        @hora_atual = conn.select_one "SELECT date_format(str_to_date(NOW(), '%Y-%m-%d %H:%i'), '%Y-%m-%d %H:%i') AS hora_atual;"
        empresa_tarefa = "INSERT INTO fatos (dataVencimentoTarefa, tarefa_id, empresa_id, departamento_id, status_id, created_at, updated_at) VALUES ('#{e[1]}', #{t[0]}, #{e[0]}, #{t[1]}, 2, '#{@hora_atual['hora_atual']}', '#{@hora_atual['hora_atual']}');" 
        ActiveRecord::Base.connection.execute(empresa_tarefa);  
      end
    end

    #Estoque
    @empresas = conn.execute "SELECT id, CONCAT(DATE_FORMAT(STR_TO_DATE(NOW(), '%Y-%m-%d %H:%i'), '%Y-%m'), '-' , entregaEstoque) AS entrega_estoque FROM empresas WHERE situacao_id = 1;"

    @tarefas = conn.execute "SELECT t.id AS id_tarefa, d.id AS id_departamento FROM departamentos AS d JOIN tarefas AS t ON t.departamento_id = d.id WHERE departamento_id = 5 AND d.situacao_id = 1 AND t.situacao_id = 1;"

    @empresas.each do |e|     
      @tarefas.each do |t|
        @hora_atual = conn.select_one "SELECT date_format(str_to_date(NOW(), '%Y-%m-%d %H:%i'), '%Y-%m-%d %H:%i') AS hora_atual;"
        empresa_tarefa = "INSERT INTO fatos (dataVencimentoTarefa, tarefa_id, empresa_id, departamento_id, status_id, created_at, updated_at) VALUES ('#{e[1]}', #{t[0]}, #{e[0]}, #{t[1]}, 2, '#{@hora_atual['hora_atual']}', '#{@hora_atual['hora_atual']}');" 
        ActiveRecord::Base.connection.execute(empresa_tarefa);  
      end
    end

  redirect_to action: "index" 
  
  end

end
