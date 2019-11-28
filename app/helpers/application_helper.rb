module ApplicationHelper

    def menu_lateral
        conn = ActiveRecord::Base.connection
        @departamento = conn.execute "SELECT id, nomeDepartamento, abreviacao FROM departamentos ORDER BY nomeDepartamento ASC;"
    end

end
