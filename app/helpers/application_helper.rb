module ApplicationHelper

    def menu_lateral
        conn = ActiveRecord::Base.connection
        @departamento = conn.execute "SELECT id, nomeDepartamento, abreviacao FROM departamentos ORDER BY nomeDepartamento ASC;"
    end

    def mes_atual
        conn = ActiveRecord::Base.connection
        @mes_atual = conn.select_one "SELECT MAX(REPLACE(RIGHT(date_format(str_to_date(dataVencimentoTarefa, '%Y-%m-%d'), '%d/%m/%Y'),7),'/','')) AS mes_atual FROM fatos;"
    end

    def teste
        conn = ActiveRecord::Base.connection
        @empresas = conn.execute "SELECT id FROM empresas WHERE statusEmpresa = 'Ativa';"
        @tarefas =  conn.execute "SELECT t.id AS id_tarefa, d.id AS id_departamento FROM departamentos AS d JOIN tarefas AS t ON t.departamento_id = d.id;"

        @empresa_tarefa

        @empresas.each do |e|
            @tarefas.each do |t|
                @empresa_tarefa = conn.execute "INSERT INTO fatos (dataVencimentoTarefa, tarefa_id, empresa_id, departamento_id, status_id) VALUES ('2019/09/12', #{d[0]}, #{e[0]}, #{d[1]}, 2);" 
            end
        end
    end

end
