class UsersBackoffice::WelcomeController < UsersBackofficeController
  def index

    conn = ActiveRecord::Base.connection
    
    @pendentesFolha = conn.execute "SELECT COUNT(*) AS contagem FROM fatos WHERE status_id = 2 AND (departamento_id = 1);"
    @pendentesEscrita = conn.execute "SELECT COUNT(*) AS contagem FROM fatos WHERE status_id = 2 AND (departamento_id = 2);"
    @pendentesAtivo = conn.execute "SELECT COUNT(*) AS contagem FROM fatos WHERE status_id = 2 AND (departamento_id = 3);"
    @pendentesPagamentoRecebimento = conn.execute "SELECT COUNT(*) AS contagem FROM fatos WHERE status_id = 2 AND (departamento_id = 4);"
    @pendentesEstoque = conn.execute "SELECT COUNT(*) AS contagem FROM fatos WHERE status_id = 2 AND (departamento_id = 5);"

    
  end

end
