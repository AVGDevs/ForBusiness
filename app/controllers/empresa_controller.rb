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

    @empresas = conn.execute "SELECT
    id, 
    CONCAT(DATE_FORMAT(STR_TO_DATE(NOW(), '%Y-%m-%d %H:%i'), '%Y-%m'), '-' , entregaFolhaDePagamento) AS entrega_folha,
    CONCAT(DATE_FORMAT(STR_TO_DATE(NOW(), '%Y-%m-%d %H:%i'), '%Y-%m'), '-' , entregaEscritaFiscal) AS entrega_escrita,
    CONCAT(DATE_FORMAT(STR_TO_DATE(NOW(), '%Y-%m-%d %H:%i'), '%Y-%m'), '-' , entregaAtivoFixo) AS entrega_ativo,
    CONCAT(DATE_FORMAT(STR_TO_DATE(NOW(), '%Y-%m-%d %H:%i'), '%Y-%m'), '-' , entregaPgtoERecebimento) AS entrega_pgto,
    CONCAT(DATE_FORMAT(STR_TO_DATE(NOW(), '%Y-%m-%d %H:%i'), '%Y-%m'), '-' , entregaEstoque) AS entrega_estoque
    FROM empresas WHERE situacao_id = 1;"
    
    @verificacao_de_data = conn.execute "SELECT
    id, 
    entregaFolhaDePagamento AS entrega_folha,
    entregaEscritaFiscal AS entrega_escrita,
    entregaAtivoFixo AS entrega_ativo,
    entregaPgtoERecebimento AS entrega_pgto,
    entregaEstoque AS entrega_estoque
    FROM empresas WHERE situacao_id = 1;"

    @departamentos = conn.execute "SELECT id FROM departamentos;"
    @mes_atual = conn.select_one "SELECT MONTH(NOW()) AS mes_atual;"

    @departamentos.each do |d|
      @empresas.each do |e| 
        @tarefas = conn.execute "SELECT t.id AS id_tarefa, d.id AS id_departamento
        FROM departamentos AS d 
        JOIN tarefas AS t ON t.departamento_id = d.id 
        WHERE d.situacao_id = 1 AND t.situacao_id = 1 AND t.departamento_id = #{d[0]};"    
        @tarefas.each do |t|
          @hora_atual = conn.select_one "SELECT date_format(str_to_date(NOW(), '%Y-%m-%d %H:%i'), '%Y-%m-%d %H:%i') AS hora_atual;"
        
        @verificacao_de_data.each do |v|
          verificacao_dia = e[d[0]]
          verificacao_dia = verificacao_dia[-2, 2]

          if (verificacao_dia == "31" and @mes_atual['mes_atual'] == 2) or (verificacao_dia == "30" and @mes_atual['mes_atual'] == 2) or (verificacao_dia == "29" and @mes_atual['mes_atual'] == 2)
            @empresa_tarefa = "INSERT INTO fatos (dataVencimentoTarefa, tarefa_id, empresa_id, departamento_id, status_id, created_at, updated_at) VALUES (CONCAT(YEAR(NOW()), '-', MONTH(NOW()), '-', 28), #{t[0]}, #{e[0]}, #{t[1]}, 2, '#{@hora_atual['hora_atual']}', '#{@hora_atual['hora_atual']}');"
          elsif (verificacao_dia == "31" and @mes_atual['mes_atual'] == 4) or (verificacao_dia == "31" and @mes_atual['mes_atual'] == 6) or (verificacao_dia == "31" and @mes_atual['mes_atual'] == 9) or (verificacao_dia == "31" and @mes_atual['mes_atual'] == 11)
            @empresa_tarefa = "INSERT INTO fatos (dataVencimentoTarefa, tarefa_id, empresa_id, departamento_id, status_id, created_at, updated_at) VALUES (CONCAT(YEAR(NOW()), '-', MONTH(NOW()), '-', 30), #{t[0]}, #{e[0]}, #{t[1]}, 2, '#{@hora_atual['hora_atual']}', '#{@hora_atual['hora_atual']}');"            
          else
            @empresa_tarefa = "INSERT INTO fatos (dataVencimentoTarefa, tarefa_id, empresa_id, departamento_id, status_id, created_at, updated_at) VALUES ('#{e[d[0]]}', #{t[0]}, #{e[0]}, #{t[1]}, 2, '#{@hora_atual['hora_atual']}', '#{@hora_atual['hora_atual']}');"
          end 
        end  
      ActiveRecord::Base.connection.execute(@empresa_tarefa);
      end
    end
  end

  redirect_to action: "index" 

end

end