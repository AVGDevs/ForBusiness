class AddColumnStatusIdToFatos < ActiveRecord::Migration[5.2]
  def change
    add_column :fatos, :status_id, :integer
    remove_column :fatos, :statusTarefa
  end
end
