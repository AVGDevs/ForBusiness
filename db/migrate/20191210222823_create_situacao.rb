class CreateSituacao < ActiveRecord::Migration[5.2]
  def change
    create_table :situacaos do |t|
      t.string :situacao
    end
  end
end
