class UsersBackoffice::WelcomeController < UsersBackofficeController
  def index

    conn = ActiveRecord::Base.connection
    
    @pendentesFolha = conn.execute "SELECT COUNT(*) AS contagem FROM fatos WHERE statusTarefa = 'Pendente' AND (tarefa_id = 1 OR tarefa_id = 2 OR tarefa_id = 3);"
    @pendentesEscrita = conn.execute "SELECT COUNT(*) AS contagem FROM fatos WHERE statusTarefa = 'Pendente' AND (tarefa_id = 4 OR tarefa_id = 5 OR tarefa_id = 6 or tarefa_id = 7 OR tarefa_id = 8 OR tarefa_id = 9);"
    @pendentesAtivo = conn.execute "SELECT COUNT(*) AS contagem FROM fatos WHERE statusTarefa = 'Pendente' AND (tarefa_id = 10 OR tarefa_id = 11 OR tarefa_id = 12);"
    @pendentesPagamentoRecebimento = conn.execute "SELECT COUNT(*) AS contagem FROM fatos WHERE statusTarefa = 'Pendente' AND (tarefa_id = 13 OR tarefa_id = 14 OR tarefa_id = 15 OR tarefa_id = 16);"
    @pendentesEstoque = conn.execute "SELECT COUNT(*) AS contagem FROM fatos WHERE statusTarefa = 'Pendente' AND (tarefa_id = 17 OR tarefa_id = 18);"

    
  end

end
