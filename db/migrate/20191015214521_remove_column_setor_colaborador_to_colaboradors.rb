class RemoveColumnSetorColaboradorToColaboradors < ActiveRecord::Migration[5.2]
  def change
    remove_column :colaboradors, :setorColaborador
  end
end
