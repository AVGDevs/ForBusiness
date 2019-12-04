module ApplicationHelper

    def menu_lateral
        conn = ActiveRecord::Base.connection
        @departamento = conn.execute "SELECT id, nomeDepartamento, abreviacao FROM departamentos ORDER BY nomeDepartamento ASC;"
    end

    def mes_atual
        conn = ActiveRecord::Base.connection
        @mes_atual = conn.select_one "SELECT MAX(REPLACE(RIGHT(date_format(str_to_date(dataVencimentoTarefa, '%Y-%m-%d'), '%d/%m/%Y'),7),'/','')) AS mes_atual FROM fatos;"
    end
    

end
