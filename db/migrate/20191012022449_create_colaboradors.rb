class CreateColaboradors < ActiveRecord::Migration[5.2]
  def change
    create_table :colaboradors do |t|
      t.string :nomeColaborador
      t.string :cpfColaborador
      t.string :setorColaborador

      t.timestamps
    end
  end
end
