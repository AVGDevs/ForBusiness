class CreateLogUsuario < ActiveRecord::Migration[5.2]
  def change
    create_table :log_usuarios do |t|
      t.integer :tarefa_id
      t.string :email
      t.string :acao

      t.timestamp
    end
  end
end
