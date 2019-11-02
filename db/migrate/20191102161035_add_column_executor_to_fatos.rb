class AddColumnExecutorToFatos < ActiveRecord::Migration[5.2]
  def change
    add_column :fatos, :executor, :string
  end
end
