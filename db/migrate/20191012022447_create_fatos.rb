class CreateFatos < ActiveRecord::Migration[5.2]
  def change
    create_table :fatos do |t|
      t.string :statusTarefa
      t.date :dataVencimentoTarefa
      t.string :logColaborador

      t.timestamps
    end
  end
end
