class RemoveColumnExecutorForFatos < ActiveRecord::Migration[5.2]
  def change
    remove_column :fatos, :executor
  end
end
